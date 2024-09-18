--Context Tanımlama 
BEGIN 
  DBMS_SESSION.CREATE_CONTEXT('MY_CONTEXT', 'my_context_pkg'); 
END; 
/

--Context Silme
BEGIN 
  DBMS_SESSION.DROP_CONTEXT('MY_CONTEXT'); 
END; 
/ 

--Context Değerini Silmek Yerine Null Yapabiliriz
BEGIN 
  DBMS_SESSION.SET_CONTEXT('MY_CONTEXT', 'USER_NAME', NULL); 
END; 
/ 

--Context Deger Atama
BEGIN
  DBMS_SESSION.SET_CONTEXT('MY_CONTEXT', ‘USER_NAME’, ‘DTAHMET’); 
END;
/

--Özniteliğe Erişmek İçin
SELECT SYS_CONTEXT('MY_CONTEXT', 'USER_NAME') AS user_name FROM dual; 

--Tanımlı Bağlamları Görüntüleme 
SELECT * FROM DBA_CONTEXT WHERE SCHEMA = 'DTUSER';

--Bağlam Özniteliklerini Görüntüleme 
SELECT * FROM DBA_CONTEXT_AUDIT_TRAIL WHERE NAMESPACE = 'MYCONTEXT'; 


--Oturum Bilgilerini Saklama
BEGIN 
   DBMS_SESSION.SET_CONTEXT('MYCONTEXT', 'SESSION_ID', SYS_CONTEXT('USERENV', 'SESSIONID')); 
   DBMS_SESSION.SET_CONTEXT('MYCONTEXT', 'SESSION_START_TIME', SYSDATE); 
END;
/


--Kullanıcı Bilgilerini Saklama 
BEGIN 
  DBMS_SESSION.SET_CONTEXT('MYCONTEXT', 'USER_NAME', 'MYDATABASEUSERNAME'); 
  DBMS_SESSION.SET_CONTEXT('MYCONTEXT', 'USER_ROLE', 'admin'); 
END;
/


--Güvenlik ve Yetkilendirme
BEGIN 
  DBMS_SESSION.SET_CONTEXT('MYCONTEXT', 'USER_PRIVILEGES', 'READ,WRITE,EXECUTE'); 
END;
/