import java.math.BigDecimal;

import javax.print.event.PrintEvent;
import javax.print.event.PrintJobListener;

public class numbers {

    public static void main(String[] args) {
        BigDecimal n1 = new BigDecimal("10.0000000002");
        BigDecimal n2 = new BigDecimal("10.0000000002");

        BigDecimal n3 = n1.add(n2);

        BigDecimal n4 = n1.multiply(n2);

        BigDecimal n5 = n4.divide(n2);

        System.out.println(n3);
        System.out.println(n4);
        System.out.println(n5);
    }

}