/**
 * ClassName: RadomUtil <br/>
 * Description: <br/>
 * date: 2021/5/5 12:03<br/>
 *
 * @author li yi<br/>
 */
package com.wingstudioly.guard.Utils;

/**
 * ClassName:RadomUtil<br/>
 * Description:<br/>
 * date:2021/5/5 12:03<br/>
 *
 * @author li yi<br/>
 */
public class RadomUtil {
    public static String getRandom() {
        //生成一个10位随机数
        String[] letters = new String[]{
                "q", "w", "e", "r", "t", "y", "u", "i", "o", "p", "a", "s", "d", "f", "g", "h", "j", "k", "l", "z", "x", "c", "v", "b", "n", "m",
                "A", "W", "E", "R", "T", "Y", "U", "I", "O", "P", "A", "S", "D", "F", "G", "H", "J", "K", "L", "Z", "X", "C", "V", "B", "N", "M",
                "0", "1", "2", "3", "4", "5", "6", "7", "8", "9"};
        StringBuilder code = new StringBuilder();
        for (int i = 0; i < 10; i++) {
            code.append(letters[(int) Math.floor(Math.random() * letters.length)]);
        }
        return code.toString();
    }
}
