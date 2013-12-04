/*
 * 作者: kingthy
 * MSN : kingthy@gmail.com
 * 日期: 2008-05-11
 * 博客: 
 * 
 * 说明: 你可以自由使用本程序,但希望你不要删除此注释.如果你对此程序进行功能扩充或优化修改希望你能发一份给作者,谢谢:)
 */
using System;
using System.Collections.Generic;
using System.Drawing;
using System.IO;
namespace Kingthy.Library.Image
{
    /// <summary>
    /// BMCP文件
    /// </summary>
    public static class Bmcp
    {
        #region ColorPoint
        /// <summary>
        /// 颜色象素点
        /// </summary>
        private class ColorPoint
        {
            public ColorPoint()
            {
            }
            public ColorPoint(Color color, int index)
            {
                this.Color = color;
                this.Index = index;
            }
            public ColorPoint(Color color, int index, byte count)
            {
                this.Color = color;
                this.Index = index;
                this.Count = count;
            }
            /// <summary>
            /// 颜色值
            /// </summary>
            public Color Color
            {
                get;
                set;
            }
            /// <summary>
            /// 此象素点在颜色表所占的索引位置
            /// </summary>
            public int Index
            {
                get;
                set;
            }
            /// <summary>
            /// 此象素点颜色连续出现的次数
            /// </summary>
            public byte Count
            {
                get;
                set;
            }
            /// <summary>
            /// 转换为字节数组
            /// </summary>
            /// <param name="size"></param>
            /// <returns></returns>
            public byte[] ToBytes(byte size)
            {
                byte[] buffer = Bmcp.GetCompressBytes(this.Index, size);

                Array.Resize<byte>(ref buffer, buffer.Length + 1);
                buffer[buffer.Length - 1] = this.Count;

                return buffer;
            }
        }
        #endregion

        /// <summary>
        /// 压缩位图文件
        /// </summary>
        /// <param name="imageFile"></param>
        /// <param name="fileName"></param>
        public static void Compress(string imageFile, string fileName)
        {
            using (Bitmap image = new Bitmap(imageFile))
            {
                Compress(image, fileName);
            }
        }
        
        /// <summary>
        /// 压缩位图文件
        /// </summary>
        /// <param name="image"></param>
        /// <param name="fileName"></param>
        public static void Compress(Bitmap image, string fileName)
        {
            int x, y;
            int index;

            //建立颜色表
            Dictionary<Color, int> colorTable = new Dictionary<Color, int>();

            //象素点队列
            List<ColorPoint> pointTable = new List<ColorPoint>();
            index = 0;

            //获取第一点的象素颜色
            ColorPoint point = new ColorPoint(image.GetPixel(0, 0), 0, 0);
            for (y = 0; y < image.Height; y++)
            {
                for (x = 0; x < image.Width; x++)
                {
                    Color color = image.GetPixel(x, y);
                    //将新颜色添加到颜色表中
                    if (!colorTable.ContainsKey(color))
                    {
                        colorTable.Add(color, index++);
                    }

                    //判断颜色出现的次数
                    if (point.Color == color && point.Count < byte.MaxValue)
                    {
                        point.Count++;
                    }
                    else
                    {
                        //取得当前象素颜色所在颜色表的位置
                        point.Index = colorTable[point.Color];
                        pointTable.Add(point);

                        //处理下一个颜色
                        point = new ColorPoint(color, 0, 1);
                    }
                }
            }
            //处理最后的数据
            if (point.Count > 0)
            {
                point.Index = colorTable[point.Color];
                pointTable.Add(point);
            }

            WriteCompressPictureToStream(image, colorTable, pointTable, fileName);
        }

        /// <summary>
        /// 还原压缩后的BMCP文件
        /// </summary>
        /// <param name="fileName">需要还原的.bmcp文件地址</param>
        /// <returns></returns>
        public static Bitmap Decompress(string fileName)
        {
            using (FileStream stream = new FileStream(fileName, FileMode.Open, FileAccess.Read, FileShare.Read))
            {
                if (stream.Length < 22) return null;    //?文件长度不对

                //读取标识头(4字节)
                byte[] flag = ReadFromStream(stream, 4);
                if (flag[0] != (byte)'b'
                    || flag[1] != (byte)'m'
                    || flag[2] != (byte)'c'
                    || flag[3] != (byte)'p') return null;

                //读取扩展位(当前未用,1字节);
                stream.ReadByte();

                //读取图片的宽度与高度(各占4字节)
                int width = BitConverter.ToInt32(ReadFromStream(stream, 4), 0);
                int height = BitConverter.ToInt32(ReadFromStream(stream, 4), 0);
                int i;

                //读取颜色表的总数(占4字节)
                int colorCount = BitConverter.ToInt32(ReadFromStream(stream, 4), 0);

                //读取颜色表(每颜色占用4字节)
                List<Color> colorTable = new List<Color>(colorCount);
                try
                {
                    for (i = 0; i < colorCount; i++)
                    {
                        //读取颜色
                        //colorTable.Add(Color.FromArgb(stream.ReadByte(),stream.ReadByte(),stream.ReadByte())); //不处理Alpha通道
                        colorTable.Add(Color.FromArgb(BitConverter.ToInt32(ReadFromStream(stream, 4), 0)));
                    }
                }
                catch
                {
                    throw new Exception("读取颜色表时出错");
                }

                //还原图像
                Bitmap bitmap = new Bitmap(width, height);
                byte size = GetCompressByteSize(colorCount);
                int x, y;
                int colorIndex, pointCount;
                try
                {
                    x = -1; y = 0;
                    do
                    {
                        colorIndex = GetCompressBytesValue(ReadFromStream(stream, size), size);
                        //读取颜色连接出现的数量
                        pointCount = stream.ReadByte();

                        //画图
                        for (i = 0; i < pointCount; i++)
                        {
                            x++;
                            if (x >= width)
                            {
                                x = 0;
                                y++;
                            }
                            bitmap.SetPixel(x, y, colorTable[colorIndex]);
                        }
                        if (y >= (height - 1)) break;
                    } while (true);
                }
                catch (Exception e)
                {
                    throw new Exception("还原图像时出错", e);
                }

                return bitmap;
            }
        }

        #region 私有函数
        /// <summary>
        /// 写入文件流
        /// </summary>
        /// <param name="image"></param>
        /// <param name="colorTable"></param>
        /// <param name="pointTable"></param>
        /// <param name="fileName"></param>
        private static void WriteCompressPictureToStream(Bitmap image, Dictionary<Color, int> colorTable, List<ColorPoint> pointTable, string fileName)
        {
            //写文件
            using (FileStream stream = new FileStream(fileName, FileMode.Create, FileAccess.Write))
            {
                //写入标识头,bmcp(占4字节)
                WriteToStream(stream, new byte[] { (byte)'b', (byte)'m', (byte)'c', (byte)'p' });
                //写入扩展位(当前未用,1字节)
                stream.WriteByte(0);

                //写入图片的宽,高度(各占4字节)
                WriteToStream(stream, BitConverter.GetBytes(image.Width));
                WriteToStream(stream, BitConverter.GetBytes(image.Height));
                //写入颜色表的总数(占4字节)
                WriteToStream(stream, BitConverter.GetBytes(colorTable.Keys.Count));
                //写入颜色表(每颜色占用4字节)
                foreach (Color color in colorTable.Keys)
                {
                    //下面是不处理Alpha通道的话则占用3字节
                    //stream.WriteByte(color.R);
                    //stream.WriteByte(color.G);
                    //stream.WriteByte(color.B);
                    WriteToStream(stream, BitConverter.GetBytes(color.ToArgb()));
                }
                //写入各象素的颜色索引和次数(索引占用大小根据颜色表的多少而变,次数占用1字节)
                byte size = GetCompressByteSize((int)colorTable.Keys.Count);
                foreach (ColorPoint point in pointTable)
                {
                    WriteToStream(stream, point.ToBytes(size));
                }
            }
        }

        /// <summary>
        /// 获取压缩数据的转换为字节的大小
        /// </summary>
        /// <param name="size"></param>
        /// <returns></returns>
        private static byte GetCompressByteSize(int size)
        {
            if (size < byte.MaxValue)
            {
                return 1;       //1字节存储
            }
            else if (size < ushort.MaxValue)
            {
                return 2;       //2字节存储
            }
            else if (size < (ushort.MaxValue * 255))
            {
                return 3;       //3字节存储
            }
            else
            {
                return 4;       //4字节存储
            }
        }

        /// <summary>
        /// 将某个int值转换为字节数组
        /// </summary>
        /// <param name="value"></param>
        /// <param name="size">要转换的字节大小</param>
        /// <returns></returns>
        private static byte[] GetCompressBytes(int value, byte size)
        {
            byte[] buffer;
            switch (size)
            {
                case 1:
                    buffer = new byte[] { (byte)value };
                    break;
                case 2:
                    buffer = BitConverter.GetBytes((ushort)value);
                    break;
                case 3:
                    ushort v = (ushort)(value / 255);   //整数部分
                    byte m = (byte)(value % 255);       //余数
                    buffer = BitConverter.GetBytes(v);
                    Array.Resize<byte>(ref buffer, 3);  //转换为3字节
                    buffer[2] = m;
                    break;
                default:
                    buffer = BitConverter.GetBytes(value);
                    break;
            }
            return buffer;
        }
        /// <summary>
        /// 还原压缩字节的数值
        /// </summary>
        /// <param name="bytes"></param>
        /// <param name="size"></param>
        /// <returns></returns>
        private static int GetCompressBytesValue(byte[] bytes, byte size)
        {
            switch (size)
            {
                case 1:
                    return bytes[0];
                case 2:
                    return BitConverter.ToUInt16(bytes, 0);
                case 3:
                    ushort v = BitConverter.ToUInt16(new byte[] { bytes[0], bytes[1] }, 0);  //整数部分
                    return (v * 255 + bytes[2]);
                default:
                    return BitConverter.ToInt32(bytes, 0);
            }
        }

        /// <summary>
        /// 写入数据流
        /// </summary>
        /// <param name="stream"></param>
        /// <param name="data"></param>
        private static void WriteToStream(FileStream stream, byte[] data)
        {
            stream.Write(data, 0, data.Length);
        }
        /// <summary>
        /// 从数据流读取字节数据
        /// </summary>
        /// <param name="stream"></param>
        /// <param name="maxSize"></param>
        /// <returns></returns>
        private static byte[] ReadFromStream(FileStream stream, int maxSize)
        {
            byte[] buffer = new byte[maxSize];
            int size = stream.Read(buffer, 0, maxSize);

            if (size != maxSize) Array.Resize<byte>(ref buffer, size);

            return buffer;
        }

        #endregion
    }
}
