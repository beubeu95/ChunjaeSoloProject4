package kr.ed.haebeop.domain;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class PaymentVO {
    private int pno;
    private int lno;
    private String tname;
    private String title;
    private String sdate;
    private String edate;
    private String tdate;
    private String bcode;
    private String bname;
    private String id;
    private int pt;
    private String method;
    private String com;
    private String price;
    private String account;
    private String dno;
    private String resdate;
}
