from http.server import BaseHTTPRequestHandler, HTTPServer
import logging
import datetime
import FN_BANCO as db
    

class S(BaseHTTPRequestHandler):

    def _directory(self,url,host):
        return_url = db.FnConsultaURL(url,host)
        return_url = return_url['REDIRECT'][0]
        return return_url   

    def _set_response_direct(self):
        self.send_response(302)

        #infos
        identify_url = (self.path[1:].find('/'))
        url = str(self.path[1:identify_url + 1 ])
        hash = str(self.path[identify_url + 2:])
        host = str(self.headers['Host'])
        path = str(self.path) 
        metod = str(self.headers['X-Forwarded-Scheme'])
        visit_url = (metod + '://' + host + path)
        UserAgente = self.headers['User-Agent']
        address_extern = str(self.headers['X-Real-IP'])
        address = self.client_address
        identify = str(address).find('\'',2,20)
        address_intern = str(address)[2:identify]
        mode = str((self.headers['sec-fetch-mode']))

        if(address_extern == 'None'): 
            address_client = address_intern 
        else: 
            address_client = address_extern 


        ###

        return_url = self._directory(url,host)
        self.send_header('Location',return_url)
        self.end_headers()
        self._return(hash,url,address_client,UserAgente,visit_url,host,mode)

    def _return(self,hash,url,address_client,UserAgente,visit_url,host,mode):
        hr = datetime.datetime.now()
        db.FnInsertRetorno(url,hash,hr,address_client,UserAgente,visit_url,host,mode)

    def do_GET(self):
        self._set_response_direct()
        
        
def run(server_class=HTTPServer, handler_class=S, port={PORTA}):
    logging.basicConfig(level=logging.INFO)
    server_address = ('', port)
    httpd = server_class(server_address, handler_class)
    logging.info('Iniciando conexecao com porta: ' + str(port))
    try:
        httpd.serve_forever()
    except KeyboardInterrupt:
        pass
    httpd.server_close()
    logging.info('Finalizando conexao\n')

if __name__ == '__main__':
    from sys import argv

    if len(argv) == 2:
        run(port=int(argv[1]))
    else:
        run()



