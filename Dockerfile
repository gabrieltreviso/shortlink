FROM laudio/pyodbc:1.0.8


#change point
RUN apt-get update --allow-releaseinfo-change -yqq \
    && apt-get install -y --no-install-recommends openssl \
    && sed -i 's,^\(MinProtocol[ ]*=\).*,\1'TLSv1.0',g' /etc/ssl/openssl.cnf \
    && rm -rf /var/lib/apt/lists/*



# install SQL Server drivers and tools
RUN apt-get update --allow-releaseinfo-change
RUN ACCEPT_EULA=Y apt-get install -y msodbcsql17
RUN echo 'export PATH="$PATH:/opt/mssql-tools/bin"' >> ~/.bashrc
RUN /bin/bash -c "source ~/.bashrc"


WORKDIR /app

# Copy code to container
COPY . .



RUN pip install -r requirements.txt

CMD ["python", "FN_SHORTLINK.py"]