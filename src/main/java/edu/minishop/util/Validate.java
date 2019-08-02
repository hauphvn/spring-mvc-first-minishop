package edu.minishop.util;

import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class Validate {
    private static final String EMAIL_PATTERN = "^[_A-Za-z0-9-\\+]+" +
            "(\\.[_A-Za-z0-9-]+)*@"+ "[A-Za-z0-9-]+" +
            "(\\.[A-Za-z0-9]+)*(\\.[A-Za-z]{2,})$";
    private static final Pattern VALID_EMAIL_ADDRESS_REGEX = Pattern.compile(EMAIL_PATTERN, Pattern.CASE_INSENSITIVE);
    public boolean Email(String email){
        Matcher matcher = VALID_EMAIL_ADDRESS_REGEX.matcher(email);
        return matcher.find();
    }
}


//package Test;
//        import java.util.regex.Matcher;
//        import java.util.regex.Pattern;
//public class EmailValidator{
//    private static final String EMAIL_PATTERN = "^[_A-Za-z0-9-\\+]+(\\.[_A-Za-z0-9-]+)*@"
//            + "[A-Za-z0-9-]+(\\.[A-Za-z0-9]+)*(\\.[A-Za-z]{2,})$";// cấu trúc 1 email thông thường
//
//    public EmailValidator() {
//        pattern = Pattern.compile(EMAIL_PATTERN);
//    }
//
//    // Class kiểm định dạng email
//    public boolean validate(final String hex) {
//
//        matcher = pattern.matcher(hex);
//        return matcher.matches();
//
//    }
//
//    // main và test
//    public static void main(String[] args) {
//        String email = "nguyendangkhiemit@gmail.com";
//        EmailValidator validator = new EmailValidator();
//        if (validator.validate(email)) {
//            System.out.println("Email hợp lệ");
//        } else {
//            System.out.println("Email không hợp lệ");
//        }
//    }
//}