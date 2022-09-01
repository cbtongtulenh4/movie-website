package com.website.movie.utils;

import org.springframework.mail.javamail.JavaMailSenderImpl;

import java.util.Properties;
import java.util.ResourceBundle;

//@PropertySource("classpath: application.properties")
public class EmailUtil {
    /**
     * @Project: MovieWebsite
     * @Author: Fu.Minh_Phuc on 17/01/2022
     * @Github: https://github.com/cbtongtulenh4
     * @ModifiedBy:
     */

    // LEARN MORE: https://www.baeldung.com/java-email-validation-regex

    // simplest for regular expression username@domain.com
    public static final String REGEX_EMAIL_1 = "^(.+)@(\\S+) $";
    // strict regular expression ( best for English language )
    public static final String REGEX_EMAIL_2 = "^(?=.{1,64}@)[A-Za-z0-9_-]+(\\.[A-Za-z0-9_-]+)*@"
            + "[^-][A-Za-z0-9-]+(\\.[A-Za-z0-9-]+)*(\\.[A-Za-z]{2,})$";
    // strict and best for all language
    public static final String REGEX_EMAIL_3 = "^(?=.{1,64}@)[\\p{L}0-9_-]+(\\.[\\p{L}0-9_-]+)*@"
            + "[^-][\\p{L}0-9-]+(\\.[\\p{L}0-9-]+)*(\\.[\\p{L}]{2,})$";
    // RFC 5322 best for do with SQL
    public static final String REGEX_EMAIL_4 = "^[a-zA-Z0-9_!#$%&'*+/=?`{|}~^.-]+@[a-zA-Z0-9.-]+$";
    // base regular expression
    public static final String REGEX_EMAIL_5 = "^[_A-Za-z0-9-+]+"
            + "(.[_A-Za-z0-9-]+)*@[A-Za-z0-9-]+(.[A-Za-z0-9]+)*(.[A-Za-z]{2,})$";


    private static ResourceBundle resourceBundle = ResourceBundle.getBundle("application");

    private final static String HOST = resourceBundle.getString("spring.mail.host");
    private final static String PORT = resourceBundle.getString("spring.mail.port");
    private final static String USERNAME = resourceBundle.getString("spring.mail.username");
    private final static String PASSWORD = resourceBundle.getString("spring.mail.password");
    private final static String PROTOCOL = resourceBundle.getString("spring.mail.protocol");
    private final static String TRANSPORT_PROTOCOL = resourceBundle.getString("spring.mail.properties.mail.transport.protocol");
    private final static String SMTPS_AUTH = resourceBundle.getString("spring.mail.properties.mail.smtps.auth");
    //   private final static String SMTPS_STARTTLS_ENABLE = resourceBundle.getString("spring.mail.properties.mail.smtps.starttls.enable");
    private final static String SMTPS_TIMEOUT = resourceBundle.getString("spring.mail.properties.mail.smtps.timeout");
    private final static String SMTP_SOCKET_FACTORY_PORT = resourceBundle.getString("spring.mail.properties.mail.smtp.socketFactory.port");
    private final static String SMTP_SOCKET_FACTORY_CLASS = resourceBundle.getString("spring.mail.properties.mail.smtp.socketFactory.class");

    public static final String EXPIRATION = resourceBundle.getString("email.expiration");



    public static JavaMailSenderImpl constructMailSender(){

        JavaMailSenderImpl mailSender = new JavaMailSenderImpl();
        mailSender.setHost(HOST);
        mailSender.setPort(Integer.parseInt(PORT));
        mailSender.setProtocol(PROTOCOL);

//        Session session = Session.getInstance(prop,
//            new javax.mail.Authenticator() {
//                protected PasswordAuthentication getPasswordAuthentication() {
//                    return new PasswordAuthentication(username, password);
//                }
//            });

        mailSender.setUsername(USERNAME);
        mailSender.setPassword(PASSWORD);
        mailSender.setJavaMailProperties(constructMailProperties());
        return mailSender;
    }

    public static Properties constructMailProperties(){
        Properties javaMailProperties = new Properties();
        javaMailProperties.setProperty("mail.transport.protocol", TRANSPORT_PROTOCOL);
        javaMailProperties.setProperty("mail.smtps.auth", SMTPS_AUTH);
        javaMailProperties.setProperty("mail.smtp.socketFactory.port", SMTP_SOCKET_FACTORY_PORT);
        javaMailProperties.setProperty("mail.smtp.socketFactory.class", SMTP_SOCKET_FACTORY_CLASS);
        javaMailProperties.setProperty("mail.smtps.timeout", SMTPS_TIMEOUT);
        return javaMailProperties;
    }

    public static String buildContentEmail(String name, String link, String message, String subject) {
        return "<div style=\"font-family:Helvetica,Arial,sans-serif;font-size:16px;margin:0;color:#0b0c0c\">\n" +
            "\n" +
            "<span style=\"display:none;font-size:1px;color:#fff;max-height:0\"></span>\n" +
            "\n" +
            "  <table role=\"presentation\" width=\"100%\" style=\"border-collapse:collapse;min-width:100%;width:100%!important\" cellpadding=\"0\" cellspacing=\"0\" border=\"0\">\n" +
            "    <tbody><tr>\n" +
            "      <td width=\"100%\" height=\"53\" bgcolor=\"#0b0c0c\">\n" +
            "\n" +
            "        <table role=\"presentation\" width=\"100%\" style=\"border-collapse:collapse;max-width:580px\" cellpadding=\"0\" cellspacing=\"0\" border=\"0\" align=\"center\">\n" +
            "          <tbody><tr>\n" +
            "            <td width=\"70\" bgcolor=\"#0b0c0c\" valign=\"middle\">\n" +
            "                <table role=\"presentation\" cellpadding=\"0\" cellspacing=\"0\" border=\"0\" style=\"border-collapse:collapse\">\n" +
            "                  <tbody><tr>\n" +
            "                    <td style=\"padding-left:10px\">\n" +
            "\n" +
            "                    </td>\n" +
            "                    <td style=\"font-size:28px;line-height:1.315789474;Margin-top:4px;padding-left:10px\">\n" +
            "                      <span style=\"font-family:Helvetica,Arial,sans-serif;font-weight:700;color:#ffffff;text-decoration:none;vertical-align:top;display:inline-block\">Registration Confirm</span>\n" +
            "                    </td>\n" +
            "                  </tr>\n" +
            "                </tbody></table>\n" +
            "              \n" +
            "            </td>\n" +
            "          </tr>\n" +
            "        </tbody></table>\n" +
            "\n" +
            "      </td>\n" +
            "    </tr>\n" +
            "  </tbody></table>\n" +
            "  <table role=\"presentation\" class=\"m_-6186904992287805515content\" align=\"center\" cellpadding=\"0\" cellspacing=\"0\" border=\"0\" style=\"border-collapse:collapse;max-width:580px;width:100%!important\" width=\"100%\">\n" +
            "    <tbody><tr>\n" +
            "      <td width=\"10\" height=\"10\" valign=\"middle\"></td>\n" +
            "      <td>\n" +
            "\n" +
            "                <table role=\"presentation\" width=\"100%\" cellpadding=\"0\" cellspacing=\"0\" border=\"0\" style=\"border-collapse:collapse\">\n" +
            "                  <tbody><tr>\n" +
            "                    <td bgcolor=\"#1D70B8\" width=\"100%\" height=\"10\"></td>\n" +
            "                  </tr>\n" +
            "                </tbody></table>\n" +
            "\n" +
            "      </td>\n" +
            "      <td width=\"10\" valign=\"middle\" height=\"10\"></td>\n" +
            "    </tr>\n" +
            "  </tbody></table>\n" +
            "\n" +
            "\n" +
            "\n" +
            "  <table role=\"presentation\" class=\"m_-6186904992287805515content\" align=\"center\" cellpadding=\"0\" cellspacing=\"0\" border=\"0\" style=\"border-collapse:collapse;max-width:580px;width:100%!important\" width=\"100%\">\n" +
            "    <tbody><tr>\n" +
            "      <td height=\"30\"><br></td>\n" +
            "    </tr>\n" +
            "    <tr>\n" +
            "      <td width=\"10\" valign=\"middle\"><br></td>\n" +
            "      <td style=\"font-family:Helvetica,Arial,sans-serif;font-size:19px;line-height:1.315789474;max-width:560px\">\n" +
            "\n" +
            "            <p style=\"Margin:0 0 20px 0;font-size:19px;line-height:25px;color:#0b0c0c\">Hi " + name + ",</p><p style=\"Margin:0 0 20px 0;font-size:19px;line-height:25px;color:#0b0c0c\"> You registered successfully. Please click on the below link to activate your account: </p><blockquote style=\"Margin:0 0 20px 0;border-left:10px solid #b1b4b6;padding:15px 0 0.1px 15px;font-size:19px;line-height:25px\"><p style=\"Margin:0 0 20px 0;font-size:19px;line-height:25px;color:#0b0c0c\"> <span>"+ link +"</span> </p></blockquote>\n" +
            " Link will expire in "+ EXPIRATION +"  minutes. <p>See you soon</p>       \n" +
            "      </td>\n" +
            "      <td width=\"10\" valign=\"middle\"><br></td>\n" +
            "    </tr>\n" +
            "    <tr>\n" +
            "      <td height=\"30\"><br></td>\n" +
            "    </tr>\n" +
            "  </tbody></table><div class=\"yj6qo\"></div><div class=\"adL\">\n" +
            "\n" +
            "</div></div>";
    }






}
