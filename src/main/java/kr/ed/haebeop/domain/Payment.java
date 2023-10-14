package kr.ed.haebeop.domain;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Payment {
    private int pno;
    private int lno;
    private String bcode;
    private String id;
    private String method;
    private String com;
    private String price;
    private String account;
    private int dno;
    private String resdate;
}
