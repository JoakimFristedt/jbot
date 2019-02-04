FROM python:3.5

WORKDIR /usr/share/jbot

COPY ./rest /usr/share/jbot/rest
COPY ./app.py /usr/share/jbot/app.py
COPY ./__init__.py /usr/share/jbot
COPY ./requirements.txt /usr/share/jbot/requirements.txt

RUN pip3 install -r requirements.txt
RUN pip3 install gunicorn

EXPOSE 5000

CMD ["gunicorn", "--bind", "0.0.0.0:5000", "--log-level=info", "app:app"]
