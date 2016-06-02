CREATE TABLE COMTECOPSEQ
(
	TABLE_NAME            VARCHAR(20) NULL,
	NEXT_ID               NUMERIC(30) NULL,
	 PRIMARY KEY (TABLE_NAME)
)
;

CREATE UNIQUE INDEX COMTECOPSEQ_PK ON COMTECOPSEQ
(
	TABLE_NAME
)
;



CREATE TABLE COMTNRESTDE
(
	RESTDE_NO             NUMERIC(6) NOT NULL,
	RESTDE                CHAR(8) NULL,
	RESTDE_NM             VARCHAR(60) NULL,
	RESTDE_DC             VARCHAR(200) NULL,
	RESTDE_SE_CODE        VARCHAR(2) NULL,
	FRST_REGIST_PNTTM     DATETIME NULL,
	FRST_REGISTER_ID      VARCHAR(20) NULL,
	LAST_UPDT_PNTTM       DATETIME NULL,
	LAST_UPDUSR_ID        VARCHAR(20) NULL,
	 PRIMARY KEY (RESTDE_NO)
)
;

CREATE UNIQUE INDEX COMTNRESTDE_PK ON COMTNRESTDE
(
	RESTDE_NO
)
;



CREATE TABLE COMTCCMMNCLCODE
(
	CL_CODE               CHAR(3) NOT NULL,
	CL_CODE_NM            VARCHAR(60) NULL,
	CL_CODE_DC            VARCHAR(200) NULL,
	USE_AT                CHAR(1) NULL,
	FRST_REGIST_PNTTM     DATETIME NULL,
	FRST_REGISTER_ID      VARCHAR(20) NULL,
	LAST_UPDT_PNTTM       DATETIME NULL,
	LAST_UPDUSR_ID        VARCHAR(20) NULL,
	 PRIMARY KEY (CL_CODE)
)
;

CREATE UNIQUE INDEX COMTCCMMNCLCODE_PK ON COMTCCMMNCLCODE
(
	CL_CODE
)
;



CREATE TABLE COMTCCMMNCODE
(
	CODE_ID               VARCHAR(6) NOT NULL,
	CODE_ID_NM            VARCHAR(60) NULL,
	CODE_ID_DC            VARCHAR(200) NULL,
	USE_AT                CHAR(1) NULL,
	CL_CODE               CHAR(3) NULL,
	FRST_REGIST_PNTTM     DATETIME NULL,
	FRST_REGISTER_ID      VARCHAR(20) NULL,
	LAST_UPDT_PNTTM       DATETIME NULL,
	LAST_UPDUSR_ID        VARCHAR(20) NULL,
	 PRIMARY KEY (CODE_ID),
	FOREIGN KEY COMTCCMMNCODE_FK1 (CL_CODE) REFERENCES COMTCCMMNCLCODE(CL_CODE)
)
;

CREATE UNIQUE INDEX COMTCCMMNCODE_PK ON COMTCCMMNCODE
(
	CODE_ID
)
;
CREATE INDEX COMTCCMMNCODE_i01 ON COMTCCMMNCODE
(
	CL_CODE
)
;



CREATE TABLE COMTCCMMNDETAILCODE
(
	CODE_ID               VARCHAR(6) NOT NULL,
	CODE                  VARCHAR(15) NOT NULL,
	CODE_NM               VARCHAR(60) NULL,
	CODE_DC               VARCHAR(200) NULL,
	USE_AT                CHAR(1) NULL,
	FRST_REGIST_PNTTM     DATETIME NULL,
	FRST_REGISTER_ID      VARCHAR(20) NULL,
	LAST_UPDT_PNTTM       DATETIME NULL,
	LAST_UPDUSR_ID        VARCHAR(20) NULL,
	 PRIMARY KEY (CODE_ID,CODE),
	FOREIGN KEY COMTCCMMNDETAILCODE_FK1 (CODE_ID) REFERENCES COMTCCMMNCODE(CODE_ID)
)
;

CREATE UNIQUE INDEX COMTCCMMNDETAILCODE_PK ON COMTCCMMNDETAILCODE
(
	CODE_ID,
	CODE
)
;
CREATE INDEX COMTCCMMNDETAILCODE_i01 ON COMTCCMMNDETAILCODE
(
	CODE_ID
)
;



CREATE TABLE COMTNAUTHORGROUPINFO
(
	GROUP_ID              CHAR(20) NULL,
	GROUP_NM              VARCHAR(60) NOT NULL,
	GROUP_CREAT_DE        CHAR(20) NOT NULL,
	GROUP_DC              VARCHAR(100) NULL,
	 PRIMARY KEY (GROUP_ID)
)
;

CREATE UNIQUE INDEX COMTNAUTHORGROUPINFO_PK ON COMTNAUTHORGROUPINFO
(
	GROUP_ID
)
;



CREATE TABLE COMTNGNRLMBER
(
	MBER_ID               VARCHAR(20) NULL,
	PASSWORD              VARCHAR(200) NOT NULL,
	PASSWORD_HINT         VARCHAR(100) NULL,
	PASSWORD_CNSR         VARCHAR(100) NULL,
	IHIDNUM               VARCHAR(200) NULL,
	MBER_NM               VARCHAR(50) NOT NULL,
	ZIP                   VARCHAR(6) NOT NULL,
	ADRES                 VARCHAR(100) NOT NULL,
	AREA_NO               VARCHAR(4) NOT NULL,
	MBER_STTUS            VARCHAR(15) NULL,
	DETAIL_ADRES          VARCHAR(100) NULL,
	END_TELNO             VARCHAR(4) NOT NULL,
	MBTLNUM               VARCHAR(20) NOT NULL,
	GROUP_ID              CHAR(20) NULL,
	MBER_FXNUM            VARCHAR(20) NULL,
	MBER_EMAIL_ADRES      VARCHAR(50) NULL,
	MIDDLE_TELNO          VARCHAR(4) NOT NULL,
	SBSCRB_DE             DATETIME NULL,
	SEXDSTN_CODE          CHAR(1) NULL,
	ESNTL_ID              CHAR(20) NOT NULL,
	 PRIMARY KEY (MBER_ID),
	FOREIGN KEY COMTNGNRLMBER_FK1 (GROUP_ID) REFERENCES COMTNAUTHORGROUPINFO(GROUP_ID)
		ON DELETE SET NULL
)
;

CREATE UNIQUE INDEX COMTNGNRLMBER_PK ON COMTNGNRLMBER
(
	MBER_ID
)
;
CREATE INDEX COMTNGNRLMBER_i01 ON COMTNGNRLMBER
(
	GROUP_ID
)
;



CREATE TABLE COMTNORGNZTINFO
(
	ORGNZT_ID             CHAR(20) NULL,
	ORGNZT_NM             VARCHAR(20) NOT NULL,
	ORGNZT_DC             VARCHAR(100) NULL,
	 PRIMARY KEY (ORGNZT_ID)
)
;

CREATE UNIQUE INDEX COMTNORGNZTINFO_PK ON COMTNORGNZTINFO
(
	ORGNZT_ID
)
;



CREATE TABLE COMTNEMPLYRINFO
(
	EMPLYR_ID             VARCHAR(20) NOT NULL,
	ORGNZT_ID             CHAR(20) NULL,
	USER_NM               VARCHAR(60) NOT NULL,
	PASSWORD              VARCHAR(200) NOT NULL,
	EMPL_NO               VARCHAR(20) NULL,
	IHIDNUM               VARCHAR(200) NULL,
	SEXDSTN_CODE          CHAR(1) NULL,
	BRTHDY                CHAR(20) NULL,
	FXNUM                 VARCHAR(20) NULL,
	HOUSE_ADRES           VARCHAR(100) NOT NULL,
	PASSWORD_HINT         VARCHAR(100) NOT NULL,
	PASSWORD_CNSR         VARCHAR(100) NOT NULL,
	HOUSE_END_TELNO       VARCHAR(4) NOT NULL,
	AREA_NO               VARCHAR(4) NOT NULL,
	DETAIL_ADRES          VARCHAR(100) NULL,
	ZIP                   VARCHAR(6) NOT NULL,
	OFFM_TELNO            VARCHAR(20) NULL,
	MBTLNUM               VARCHAR(20) NULL,
	EMAIL_ADRES           VARCHAR(50) NULL,
	OFCPS_NM              VARCHAR(60) NULL,
	HOUSE_MIDDLE_TELNO    VARCHAR(4) NOT NULL,
	GROUP_ID              CHAR(20) NULL,
	PSTINST_CODE          CHAR(8) NULL,
	EMPLYR_STTUS_CODE     CHAR(1) NOT NULL,
	ESNTL_ID              CHAR(20) NOT NULL,
	CRTFC_DN_VALUE        VARCHAR(100) NULL,
	SBSCRB_DE             DATETIME NULL,
	 PRIMARY KEY (EMPLYR_ID),
	FOREIGN KEY COMTNEMPLYRINFO_FK2 (ORGNZT_ID) REFERENCES COMTNORGNZTINFO(ORGNZT_ID)
		ON DELETE SET NULL,
	FOREIGN KEY COMTNEMPLYRINFO_FK1 (GROUP_ID) REFERENCES COMTNAUTHORGROUPINFO(GROUP_ID)
		ON DELETE SET NULL
)
;

CREATE UNIQUE INDEX COMTNEMPLYRINFO_PK ON COMTNEMPLYRINFO
(
	EMPLYR_ID
)
;
CREATE INDEX COMTNEMPLYRINFO_i01 ON COMTNEMPLYRINFO
(
	ORGNZT_ID
)
;
CREATE INDEX COMTNEMPLYRINFO_i02 ON COMTNEMPLYRINFO
(
	GROUP_ID
)
;



CREATE TABLE COMTNENTRPRSMBER
(
	ENTRPRS_MBER_ID       VARCHAR(20) NULL,
	ENTRPRS_SE_CODE       CHAR(8) NULL,
	BIZRNO                VARCHAR(10) NULL,
	JURIRNO               VARCHAR(13) NULL,
	CMPNY_NM              VARCHAR(60) NOT NULL,
	CXFC                  VARCHAR(50) NULL,
	ZIP                   VARCHAR(6) NOT NULL,
	ADRES                 VARCHAR(100) NOT NULL,
	ENTRPRS_MIDDLE_TELNO  VARCHAR(4) NOT NULL,
	FXNUM                 VARCHAR(20) NULL,
	INDUTY_CODE           CHAR(1) NULL,
	APPLCNT_NM            VARCHAR(50) NOT NULL,
	APPLCNT_IHIDNUM       VARCHAR(200) NULL,
	SBSCRB_DE             DATETIME NULL,
	ENTRPRS_MBER_STTUS    VARCHAR(15) NULL,
	ENTRPRS_MBER_PASSWORD  VARCHAR(200) NULL,
	ENTRPRS_MBER_PASSWORD_HINT  VARCHAR(100) NOT NULL,
	ENTRPRS_MBER_PASSWORD_CNSR  VARCHAR(100) NOT NULL,
	GROUP_ID              CHAR(20) NULL,
	DETAIL_ADRES          VARCHAR(100) NULL,
	ENTRPRS_END_TELNO     VARCHAR(4) NOT NULL,
	AREA_NO               VARCHAR(4) NOT NULL,
	APPLCNT_EMAIL_ADRES   VARCHAR(50) NOT NULL,
	ESNTL_ID              CHAR(20) NOT NULL,
	 PRIMARY KEY (ENTRPRS_MBER_ID),
	FOREIGN KEY COMTNENTRPRSMBER_FK1 (GROUP_ID) REFERENCES COMTNAUTHORGROUPINFO(GROUP_ID)
		ON DELETE SET NULL
)
;

CREATE UNIQUE INDEX COMTNENTRPRSMBER_PK ON COMTNENTRPRSMBER
(
	ENTRPRS_MBER_ID
)
;
CREATE INDEX COMTNENTRPRSMBER_i01 ON COMTNENTRPRSMBER
(
	GROUP_ID
)
;





CREATE  VIEW COMVNUSERMASTER ( ESNTL_ID,USER_ID,PASSWORD,USER_NM,USER_ZIP,USER_ADRES,USER_EMAIL,GROUP_ID, USER_SE, ORGNZT_ID ) 
AS  
		SELECT ESNTL_ID, MBER_ID,PASSWORD,MBER_NM,ZIP,ADRES,MBER_EMAIL_ADRES,' ','GNR' AS USER_SE, ' ' ORGNZT_ID
		FROM COMTNGNRLMBER
		
	UNION ALL
		SELECT ESNTL_ID,EMPLYR_ID,PASSWORD,USER_NM,ZIP,HOUSE_ADRES,EMAIL_ADRES,GROUP_ID ,'USR' AS USER_SE, ORGNZT_ID
		FROM COMTNEMPLYRINFO
	UNION ALL
		SELECT ESNTL_ID,ENTRPRS_MBER_ID,ENTRPRS_MBER_PASSWORD,CMPNY_NM,ZIP,ADRES,APPLCNT_EMAIL_ADRES,' ' ,'ENT' AS USER_SE, ' ' ORGNZT_ID
		FROM COMTNENTRPRSMBER 
ORDER BY ESNTL_ID;


CREATE TABLE COMTNFILE
(
	ATCH_FILE_ID          CHAR(20) NOT NULL,
	CREAT_DT              DATETIME NOT NULL,
	USE_AT                CHAR(1) NULL,
	 PRIMARY KEY (ATCH_FILE_ID)
)
;

CREATE UNIQUE INDEX COMTNFILE_PK ON COMTNFILE
(
	ATCH_FILE_ID
)
;



CREATE TABLE COMTNFILEDETAIL
(
	ATCH_FILE_ID          CHAR(20) NOT NULL,
	FILE_SN               NUMERIC(10) NOT NULL,
	FILE_STRE_COURS       VARCHAR(2000) NOT NULL,
	STRE_FILE_NM          VARCHAR(255) NOT NULL,
	ORIGNL_FILE_NM        VARCHAR(255) NULL,
	FILE_EXTSN            VARCHAR(20) NOT NULL,
	FILE_CN               MEDIUMTEXT NULL,
	FILE_SIZE             NUMERIC(8) NULL,
	 PRIMARY KEY (ATCH_FILE_ID,FILE_SN),
	FOREIGN KEY COMTNFILEDETAIL_FK1 (ATCH_FILE_ID) REFERENCES COMTNFILE(ATCH_FILE_ID)
)
;

CREATE UNIQUE INDEX COMTNFILEDETAIL_PK ON COMTNFILEDETAIL
(
	ATCH_FILE_ID,
	FILE_SN
)
;
CREATE INDEX COMTNFILEDETAIL_i01 ON COMTNFILEDETAIL
(
	ATCH_FILE_ID
)
;



CREATE TABLE COMTNSMS
(
	SMS_ID                CHAR(20) NULL,
	TRNSMIS_TELNO         VARCHAR(12) NOT NULL,
	TRNSMIS_CN            VARCHAR(80) NOT NULL,
	FRST_REGIST_PNTTM     DATETIME NOT NULL,
	FRST_REGISTER_ID      VARCHAR(20) NOT NULL,
	 PRIMARY KEY (SMS_ID)
)
;

CREATE UNIQUE INDEX COMTNSMS_PK ON COMTNSMS
(
	SMS_ID
)
;



CREATE TABLE COMTNSMSRECPTN
(
	SMS_ID                CHAR(20) NOT NULL,
	RECPTN_TELNO          VARCHAR(12) NULL,
	RESULT_CODE           VARCHAR(4) NULL,
	RESULT_MSSAGE         VARCHAR(4000) NULL,
	 PRIMARY KEY (SMS_ID,RECPTN_TELNO),
	FOREIGN KEY COMTNSMSRECPTN_FK1 (SMS_ID) REFERENCES COMTNSMS(SMS_ID)
)
;

CREATE UNIQUE INDEX COMTNSMSRECPTN_PK ON COMTNSMSRECPTN
(
	SMS_ID,
	RECPTN_TELNO
)
;
CREATE INDEX COMTNSMSRECPTN_i01 ON COMTNSMSRECPTN
(
	SMS_ID
)
;



CREATE TABLE COMTHTRSMRCVMNTRNGLOGINFO
(
	LOG_ID                CHAR(20) NOT NULL,
	CNTC_ID               CHAR(8) NOT NULL,
	TEST_CLASS_NM         VARCHAR(255) NULL,
	MNGR_NM               VARCHAR(60) NULL,
	MNGR_EMAIL_ADRES      VARCHAR(50) NULL,
	MNTRNG_STTUS          CHAR(2) NULL,
	LOG_INFO              VARCHAR(2000) NULL,
	CREAT_DT              DATETIME NULL,
	FRST_REGISTER_ID      VARCHAR(20) NULL,
	FRST_REGIST_PNTTM     DATETIME NOT NULL,
	LAST_UPDUSR_ID        VARCHAR(20) NULL,
	LAST_UPDT_PNTTM       DATETIME NOT NULL,
	 PRIMARY KEY (LOG_ID)
)
;

CREATE UNIQUE INDEX COMTHTRSMRCVMNTRNGLOGINFO_PK ON COMTHTRSMRCVMNTRNGLOGINFO
(
	LOG_ID
)
;



CREATE TABLE COMTHDBMNTRNGLOGINFO
(
	DATA_SOURC_NM         VARCHAR(60) NOT NULL,
	SERVER_NM             VARCHAR(60) NULL,
	DBMS_KND              VARCHAR(2) NULL,
	CECK_SQL              VARCHAR(250) NULL,
	MNGR_NM               VARCHAR(60) NULL,
	MNGR_EMAIL_ADRES      VARCHAR(50) NULL,
	MNTRNG_STTUS          CHAR(2) NULL,
	LOG_INFO              VARCHAR(2000) NULL,
	CREAT_DT              DATETIME NULL,
	FRST_REGISTER_ID      VARCHAR(20) NULL,
	FRST_REGIST_PNTTM     DATETIME NOT NULL,
	LAST_UPDT_PNTTM       DATETIME NOT NULL,
	LAST_UPDUSR_ID        VARCHAR(20) NULL,
	LOG_ID                CHAR(20) NULL,
	 PRIMARY KEY (LOG_ID)
)
;

CREATE UNIQUE INDEX COMTHDBMNTRNGLOGINFO_PK ON COMTHDBMNTRNGLOGINFO
(
	LOG_ID
)
;



CREATE TABLE COMTNSERVEREQPMNINFO
(
	SERVER_EQPMN_ID       VARCHAR(20) NOT NULL,
	SERVER_EQPMN_NM       VARCHAR(60) NULL,
	SERVER_EQPMN_IP       VARCHAR(23) NULL,
	SERVER_EQPMN_MNGR     VARCHAR(60) NULL,
	MNGR_EMAIL_ADRES      VARCHAR(50) NULL,
	OPERSYSM_INFO         VARCHAR(2000) NULL,
	CPU_INFO              VARCHAR(2000) NULL,
	MORY_INFO             VARCHAR(2000) NULL,
	HDDISK                CHAR(18) NULL,
	ETC_INFO              VARCHAR(250) NULL,
	RGSDE                 DATETIME NULL,
	FRST_REGISTER_ID      VARCHAR(20) NULL,
	FRST_REGIST_PNTTM     DATETIME NULL,
	LAST_UPDUSR_ID        VARCHAR(20) NULL,
	LAST_UPDT_PNTTM       DATETIME NULL,
	 PRIMARY KEY (SERVER_EQPMN_ID)
)
;

CREATE UNIQUE INDEX COMTNSERVEREQPMNINFO_PK ON COMTNSERVEREQPMNINFO
(
	SERVER_EQPMN_ID
)
;



CREATE TABLE COMTNSYNCHRNSERVERINFO
(
	SERVER_ID             CHAR(20) NOT NULL,
	SERVER_NM             VARCHAR(60) NULL,
	SERVER_IP             VARCHAR(23) NULL,
	SERVER_PORT           VARCHAR(10) NULL,
	FTP_ID                VARCHAR(20) NULL,
	FTP_PASSWORD          VARCHAR(20) NULL,
	SYNCHRN_LC            VARCHAR(255) NULL,
	REFLCT_AT             CHAR(1) NULL,
	FRST_REGISTER_ID      VARCHAR(20) NULL,
	FRST_REGIST_PNTTM     DATETIME NULL,
	LAST_UPDUSR_ID        VARCHAR(20) NULL,
	LAST_UPDT_PNTTM       DATETIME NULL,
	 PRIMARY KEY (SERVER_ID)
)
;

CREATE UNIQUE INDEX COMTNSYNCHRNSERVERINFO_PK ON COMTNSYNCHRNSERVERINFO
(
	SERVER_ID
)
;



CREATE TABLE COMTNSERVERINFO
(
	SERVER_ID             CHAR(20) NOT NULL,
	SERVER_NM             VARCHAR(60) NULL,
	SERVER_KND            CHAR(2) NULL,
	RGSDE                 DATETIME NULL,
	FRST_REGISTER_ID      VARCHAR(20) NULL,
	FRST_REGIST_PNTTM     DATETIME NULL,
	LAST_UPDUSR_ID        VARCHAR(20) NULL,
	LAST_UPDT_PNTTM       DATETIME NULL,
	 PRIMARY KEY (SERVER_ID)
)
;

CREATE UNIQUE INDEX COMTNSERVERINFO_PK ON COMTNSERVERINFO
(
	SERVER_ID
)
;



CREATE TABLE COMTNSERVEREQPMNRELATE
(
	SERVER_EQPMN_ID       VARCHAR(20) NOT NULL,
	FRST_REGISTER_ID      VARCHAR(20) NULL,
	FRST_REGIST_PNTTM     DATETIME NULL,
	LAST_UPDUSR_ID        VARCHAR(20) NULL,
	LAST_UPDT_PNTTM       DATETIME NULL,
	SERVER_ID             CHAR(20) NOT NULL,
	 PRIMARY KEY (SERVER_EQPMN_ID,SERVER_ID),
	FOREIGN KEY COMTNSERVEREQPMNRELATE_FK2 (SERVER_EQPMN_ID) REFERENCES COMTNSERVEREQPMNINFO(SERVER_EQPMN_ID),
	FOREIGN KEY COMTNSERVEREQPMNRELATE_FK1 (SERVER_ID) REFERENCES COMTNSERVERINFO(SERVER_ID)
)
;

CREATE UNIQUE INDEX COMTNSERVEREQPMNRELATE_PK ON COMTNSERVEREQPMNRELATE
(
	SERVER_EQPMN_ID,
	SERVER_ID
)
;



CREATE TABLE COMTNSERVERRESRCELOGINFO
(
	SERVER_EQPMN_ID       VARCHAR(20) NOT NULL,
	CPU_USE_RT            NUMERIC(3) NULL,
	MORY_USE_RT           NUMERIC(3) NULL,
	SVC_STTUS             CHAR(2) NULL,
	LOG_INFO              VARCHAR(2000) NULL,
	CREAT_DT              DATETIME NULL,
	FRST_REGISTER_ID      VARCHAR(20) NULL,
	FRST_REGIST_PNTTM     DATETIME NULL,
	LAST_UPDUSR_ID        VARCHAR(20) NULL,
	SERVER_ID             CHAR(20) NOT NULL,
	LAST_UPDT_PNTTM       DATETIME NULL,
	LOG_ID                CHAR(20) NULL,
	 PRIMARY KEY (SERVER_EQPMN_ID,SERVER_ID,LOG_ID),
	FOREIGN KEY COMTNSERVERRESRCELOGINFO_FK1 (SERVER_EQPMN_ID,SERVER_ID) REFERENCES COMTNSERVEREQPMNRELATE(SERVER_EQPMN_ID,SERVER_ID)
)
;

CREATE UNIQUE INDEX COMTNSERVERRESRCELOGINFO_PK ON COMTNSERVERRESRCELOGINFO
(
	SERVER_EQPMN_ID,
	SERVER_ID,
	LOG_ID
)
;



