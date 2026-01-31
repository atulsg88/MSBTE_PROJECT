package com.epayment.Util;


public class Constant {
	
	
		//local machine
	public static String QRCODES = "E:/image/";
	public static String POSTPHOTO = "E:/image/";
	public static String POSTVIDEO = "E:/image/";
	public static String BARCODE = "E:/image/";
	
		
	
	public static String upperCaseWords(String sentence) 
	{
        String words[] = sentence.replaceAll("\\s+", " ").trim().split(" ");
        String newSentence = "";
        for (String word : words) 
        {
            for (int i = 0; i < word.length(); i++)
                newSentence = newSentence + ((i == 0) ? word.substring(i, i + 1).toUpperCase(): 
                    (i != word.length() - 1) ? word.substring(i, i + 1) : word.substring(i, i + 1) + " ");
        }

        return newSentence.trim();
    }

}
