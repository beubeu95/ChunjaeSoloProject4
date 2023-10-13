package kr.ed.haebeop.domain;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Lecture {
    private int lno;
    private String cate;
    private String title;
    private String content;
    private String img;
    private String video;
    private String price;
    private String status;
    private String sdate;
    private String edate;
    private String tdate;
    private String bcode;
    private String tcode;
    private int amt;
}
