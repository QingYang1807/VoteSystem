package com.lf.entity;

public class VoteInfo {
    String VoteInfo;
    int vtVoteOption1;
    int vtVoteOption2;
    int vtVoteOption3;
    int vtVoteOption4;

    public VoteInfo(){}
    public VoteInfo(String voteInfo, int vtVoteOption1, int vtVoteOption2, int vtVoteOption3, int vtVoteOption4) {
        VoteInfo = voteInfo;
        this.vtVoteOption1 = vtVoteOption1;
        this.vtVoteOption2 = vtVoteOption2;
        this.vtVoteOption3 = vtVoteOption3;
        this.vtVoteOption4 = vtVoteOption4;
    }

    public String getVoteInfo() {
        return VoteInfo;
    }

    public void setVoteInfo(String voteInfo) {
        VoteInfo = voteInfo;
    }

    public int getVtVoteOption1() {
        return vtVoteOption1;
    }

    public void setVtVoteOption1(int vtVoteOption1) {
        this.vtVoteOption1 = vtVoteOption1;
    }

    public int getVtVoteOption2() {
        return vtVoteOption2;
    }

    public void setVtVoteOption2(int vtVoteOption2) {
        this.vtVoteOption2 = vtVoteOption2;
    }

    public int getVtVoteOption3() {
        return vtVoteOption3;
    }

    public void setVtVoteOption3(int vtVoteOption3) {
        this.vtVoteOption3 = vtVoteOption3;
    }

    public int getVtVoteOption4() {
        return vtVoteOption4;
    }

    public void setVtVoteOption4(int vtVoteOption4) {
        this.vtVoteOption4 = vtVoteOption4;
    }
}
