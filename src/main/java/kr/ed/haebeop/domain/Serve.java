package kr.ed.haebeop.domain;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Serve {
    private int sno;
    private String bcode;
    private String sprice;
    private String amount;
    private String resdate;
}
