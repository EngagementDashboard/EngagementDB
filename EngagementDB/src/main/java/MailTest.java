import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.mail.MailSender;
import org.springframework.mail.SimpleMailMessage;

public class MailTest {
public static void main(String[] args) {
	
	ApplicationContext context=new ClassPathXmlApplicationContext("spring-hibernate.xml");

	MailSender mailSender=(MailSender)context.getBean("mailSender");
	System.out.println(mailSender.toString());
	SimpleMailMessage mailMessage=new SimpleMailMessage();
	mailMessage.setFrom("admin@localhost.localdomain");
	mailMessage.setTo("srinivasa.rao.dama@accenture.com");
	mailMessage.setSubject("Test");
	mailMessage.setText("Hai");
	//mailSender.send(mailMessage);
}
}
