package com.lf.entity;

public class Vote {
    String votesId;
    String votesName;
    String startDate;
    String endDate;
    String contentVoteDesc;
    String voteOption1;
    String voteOption2;
    String voteOption3;
    String voteOption4;
    String status;

    public Vote(){}

    public Vote(String votesId, String votesName, String startDate, String endDate, String contentVoteDesc, String voteOption1, String voteOption2, String voteOption3, String voteOption4, String status) {
        this.votesId = votesId;
        this.votesName = votesName;
        this.startDate = startDate;
        this.endDate = endDate;
        this.contentVoteDesc = contentVoteDesc;
        this.voteOption1 = voteOption1;
        this.voteOption2 = voteOption2;
        this.voteOption3 = voteOption3;
        this.voteOption4 = voteOption4;
        this.status = status;
    }

    public String getVotesId() {
        return votesId;
    }

    public void setVotesId(String votesId) {
        this.votesId = votesId;
    }

    public String getVotesName() {
        return votesName;
    }

    public void setVotesName(String votesName) {
        this.votesName = votesName;
    }

    public String getStartDate() {
        return startDate;
    }

    public void setStartDate(String startDate) {
        this.startDate = startDate;
    }

    public String getEndDate() {
        return endDate;
    }

    public void setEndDate(String endDate) {
        this.endDate = endDate;
    }

    public String getContentVoteDesc() {
        return contentVoteDesc;
    }

    public void setContentVoteDesc(String contentVoteDesc) {
        this.contentVoteDesc = contentVoteDesc;
    }

    public String getVoteOption1() {
        return voteOption1;
    }

    public void setVoteOption1(String voteOption1) {
        this.voteOption1 = voteOption1;
    }

    public String getVoteOption2() {
        return voteOption2;
    }

    public void setVoteOption2(String voteOption2) {
        this.voteOption2 = voteOption2;
    }

    public String getVoteOption3() {
        return voteOption3;
    }

    public void setVoteOption3(String voteOption3) {
        this.voteOption3 = voteOption3;
    }

    public String getVoteOption4() {
        return voteOption4;
    }

    public void setVoteOption4(String voteOption4) {
        this.voteOption4 = voteOption4;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }
}
