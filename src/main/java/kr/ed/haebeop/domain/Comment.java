package kr.ed.haebeop.domain;

import lombok.Data;

@Data
public class Comment {
    private int comNo;
    private int bno;
    private String author;
    private String resdate;
    private String content;
}