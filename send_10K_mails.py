import smtplib
from email.mime.text import MIMEText
import time

HOST = "vm-mailpit"
PORT = 1025
FROM = "admin@test.email.com"
TO = "tdc@destination.mkt.sp"
TOTAL = 10000

start = time.time()

server = smtplib.SMTP(HOST, PORT)
server.ehlo()

for i in range(1, TOTAL + 1):
    msg = MIMEText(f"This is test email - Body at position {i}")
    msg["Subject"] = f"Mailpit test from Ubuntu - {i}"
    msg["From"] = FROM
    msg["To"] = TO

    server.sendmail(FROM, [TO], msg.as_string())

server.quit()

end = time.time()

print(f"Sent {TOTAL} emails in {end - start:.2f}s")
print(f"Average: {(end - start)/TOTAL:.4f} s/mail")
