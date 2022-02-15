import pyodbc
import pandas   as pd

def ConectaBanco():
	server = {SERVER}
	database = {DATABASE}
	username = {USERNAME}
	password = {PASSWORD}
	str_conexao = 'Driver={ODBC Driver 17 for SQL Server};Server='+server+';Database='+database+';UID='+username+';PWD='+password+';'
	conexao=pyodbc.connect(str_conexao)
	return conexao.cursor()


def ConectaBancoDataFrame():
	server = {SERVER}
	database = {DATABASE}
	username = {USERNAME}
	password = {PASSWORD}
	str_conexao = 'Driver={ODBC Driver 17 for SQL Server};Server=' + server + ';Database=' + database + ';UID=' + username + ';PWD=' + password + ';'
	conexao = pyodbc.connect(str_conexao)
	return conexao


def FnConsultaURL(VarRedirect,VarHost):
    VarConsulta = "[DATABASE] '{direct}','{host}' ".format(direct=str(VarRedirect),host=str(VarHost))
    VarConsultaBanco = ConectaBancoDataFrame()
    VarDataFrame = pd.read_sql_query(VarConsulta, VarConsultaBanco)
    return VarDataFrame 


def FnInsertRetorno (VAR_NOM_COD_URL,VAR_COD_HASH,VAR_DAT_ACAO,VAR_USER_IP,VAR_USER_AGENTE,VAR_VISIT_URL,VAR_HOST,VAR_MODE):
    VarConexaoBanco = ConectaBanco()
    VarConsulta = "[DATABASE]  '{NOM_COD_URL}','{COD_HASH}','{DAT_ACAO}','{USER_IP}','{USER_AGENTE}','{VISIT_URL}','{HOST}','{MODE}'".format(NOM_COD_URL=str(VAR_NOM_COD_URL),COD_HASH=str(VAR_COD_HASH),DAT_ACAO=str(VAR_DAT_ACAO),USER_IP=str(VAR_USER_IP),USER_AGENTE=str(VAR_USER_AGENTE),VISIT_URL=str(VAR_VISIT_URL),HOST=str(VAR_HOST),MODE=str(VAR_MODE))
    VarConexaoBanco.execute(VarConsulta)
    VarConexaoBanco.commit()


