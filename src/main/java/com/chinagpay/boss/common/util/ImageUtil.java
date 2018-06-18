package com.chinagpay.boss.common.util;

import java.awt.*;
import java.awt.image.BufferedImage;
import java.util.Random;

/**
 * 图像工具
 * @author liuxi
 */
public class ImageUtil {
	
    /**
     * 验证码图片  120 * 25
     * 用于登录、注册是的验证码
     * @param ：length 验证码的位数
     * @return Object[]   0:randomCode, 验证码的字符串     1:buffImg,生成的验证码图片缓冲流
     */
    public static Object[] makeValidCodeImg( int length, int width, int height ){
        BufferedImage buffImg = new BufferedImage( width,height,BufferedImage.TYPE_INT_RGB );
        Graphics2D g = buffImg.createGraphics();

        //创建一个随机数生成器类。
        Random random = new Random();
        g.setColor( new Color(220, 220, 240) );
        g.fillRect( 0, 0, width, height );

        //创建字体，字体的大小应该根据图片的高度来定。
        Font font = new Font( "Times New Roman", Font.PLAIN, height/2 );

        //设置字体。画边框。
        g.setFont( font );
        g.setColor( Color.BLACK );
        g.drawRect( 0, 0, width-1, height-1 );

        //随机产生12条干扰线，使图象中的认证码不易被其它程序探测到。
        g.setColor( Color.GRAY );
        for( int i = 0; i < 12; i++ ){
            int x = random.nextInt( width );
            int y = random.nextInt( height );
            int xl = random.nextInt( 12 );
            int yl = random.nextInt( 12 );
            g.drawLine( x, y, x + xl, y + yl );
        }

        //randomCode用于保存随机产生的验证码，以便用户登录后进行验证。
        StringBuffer randomCode = new StringBuffer();
        int red = 0;
        int green = 0;
        int blue = 0;
        int space = ( width - 10 ) / length;

        //随机产生5位数字的验证码。
        for ( int i = 0; i < length; i ++ ){
            //得到随机产生的验证码数字。
            String strRand = "" + (int)( ( 1 + Math.random() * 8 ) );

            //产生随机的颜色分量来构造颜色值，这样输出的每位数字的颜色值都将不同。
            red = random.nextInt(200);
            green = random.nextInt(200);
            blue = random.nextInt(200);
            
            float h = ( ( height/2 ) -5 ) + (int)( Math.random() * ( height/2 ) );//随机产生高度

            //用随机产生的颜色将验证码绘制到图像中。
            g.setColor( new Color(red,green,blue) );
            g.drawString( strRand, space * i + 6, h );

            //将产生的四个随机数组合在一起。
            randomCode.append(strRand);
        }

        return new Object[]{ randomCode.toString(), buffImg };
    }
}
