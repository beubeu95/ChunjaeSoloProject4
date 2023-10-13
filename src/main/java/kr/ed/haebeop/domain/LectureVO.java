package kr.ed.haebeop.domain;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class LectureVO {
    private String lno;
    private String cate;
    private String cateName;
    private String title;
    private String content;
    private String img;
    private String price;
    private String status;
    private String sdate;
    private String edate;
    private String tdate;
    private String tname;
    private String bname;
    private int amt;
}