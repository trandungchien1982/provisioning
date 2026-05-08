from kafka import KafkaProducer

BOOTSTRAP_SERVER = "vm-kafka:29092"
TOPIC_NAME = "tdc-topic"
TOTAL_MESSAGES = 1000

producer = KafkaProducer(
    bootstrap_servers=BOOTSTRAP_SERVER,
    value_serializer=lambda v: v.encode("utf-8")
)

for idx in range(1, TOTAL_MESSAGES + 1):
    message = f"Message at idx from tdc: {idx:03d}"
    producer.send(TOPIC_NAME, value=message)
    print(f"Sent: {message}")

producer.flush()
producer.close()

print("Done.")