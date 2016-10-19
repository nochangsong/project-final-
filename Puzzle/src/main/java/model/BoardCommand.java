package model;

import java.sql.Timestamp;

public class BoardCommand {
	private int BNO;//�۹�ȣ
	private int DEPT_NUM;//�μ���ȣ
	private String SUBJECT;//����
	private String B_CONTENT;//����
	private Timestamp REG_DATE;//�ۼ�����
	private String BOARD_TYPE;//�Խ�������
	private String WRITE_TYPE;//��������
	private String WRITER;//�ۼ���
	private String NAME;//�̸�
	
	//�ڸ�Ʈ
	private int CNO;//��۹�ȣ
	private String EMAIL;//�ۼ���
	private String CONTENT;//����
	
	//��������
	private String N_CONTENT;//����
	private int POSITION_NUM;//���޹�ȣ
	

	@Override
	public String toString() {
		return "BoardCommand [BNO=" + BNO + ", DEPT_NUM=" + DEPT_NUM + ", SUBJECT=" + SUBJECT + ", B_CONTENT="
				+ B_CONTENT + ", REG_DATE=" + REG_DATE + ", BOARD_TYPE=" + BOARD_TYPE + ", WRITE_TYPE=" + WRITE_TYPE
				+ ", WRITER=" + WRITER + ", NAME=" + NAME + ", CNO=" + CNO + ", EMAIL=" + EMAIL + ", CONTENT=" + CONTENT
				+ ", N_CONTENT=" + N_CONTENT + ", POSITION_NUM=" + POSITION_NUM + "]";
	}

	public int getCNO() {
		return CNO;
	}

	public void setCNO(int cNO) {
		CNO = cNO;
	}

	public String getEMAIL() {
		return EMAIL;
	}

	public void setEMAIL(String eMAIL) {
		EMAIL = eMAIL;
	}

	public String getCONTENT() {
		return CONTENT;
	}

	public void setCONTENT(String cONTENT) {
		CONTENT = cONTENT;
	}

	public int getBNO() {
		return BNO;
	}
	public void setBNO(int bNO) {
		BNO = bNO;
	}
	public int getDEPT_NUM() {
		return DEPT_NUM;
	}
	public void setDEPT_NUM(int dEPT_NUM) {
		DEPT_NUM = dEPT_NUM;
	}
	public String getSUBJECT() {
		return SUBJECT;
	}
	public void setSUBJECT(String sUBJECT) {
		SUBJECT = sUBJECT;
	}
	public String getB_CONTENT() {
		return B_CONTENT;
	}
	public void setB_CONTENT(String b_CONTENT) {
		B_CONTENT = b_CONTENT;
	}
	public Timestamp getREG_DATE() {
		return REG_DATE;
	}
	public void setREG_DATE(Timestamp rEG_DATE) {
		REG_DATE = rEG_DATE;
	}
	

	public String getBOARD_TYPE() {
		return BOARD_TYPE;
	}

	public void setBOARD_TYPE(String bOARD_TYPE) {
		BOARD_TYPE = bOARD_TYPE;
	}

	public String getWRITE_TYPE() {
		return WRITE_TYPE;
	}
	public void setWRITE_TYPE(String wRITE_TYPE) {
		WRITE_TYPE = wRITE_TYPE;
	}
	public String getWRITER() {
		return WRITER;
	}
	public void setWRITER(String wRITER) {
		WRITER = wRITER;
	}

	public String getNAME() {
		return NAME;
	}

	public void setNAME(String nAME) {
		NAME = nAME;
	}

	public String getN_CONTENT() {
		return N_CONTENT;
	}

	public void setN_CONTENT(String n_CONTENT) {
		N_CONTENT = n_CONTENT;
	}

	public int getPOSITION_NUM() {
		return POSITION_NUM;
	}

	public void setPOSITION_NUM(int pOSITION_NUM) {
		POSITION_NUM = pOSITION_NUM;
	}
	
	
}
