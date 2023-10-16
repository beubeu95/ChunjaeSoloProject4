package kr.ed.haebeop.domain;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class DeliveryVO {
    private int pno;
    private String title;
    private String id;
    private String resdate;
    private String dstatus;
    private String dcom;
    private String dtel;
    private String edate;
    private String dcode;
    private int dno;
}
