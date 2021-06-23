import json
from google.cloud import pubsub_v1
publisher = pubsub_v1.PublisherClient()

def parse_tf_output(file):
    data = open(file).read()
    jsdata = json.loads(data)
    output = { k:v['value'] for k,v in jsdata.items() }
    return output

def main():
    tfoutput='output.json'
    tfoutputparsed=parse_tf_output(tfoutput)
    topic_id_full = tfoutputparsed['topic_id']
    topic_id = topic_id_full.split('/')[-1]
    project_id = topic_id_full.split('/')[1]
    topic_path = publisher.topic_path(project_id, topic_id)
    data = {
        'name': 'py',
        'id' : 1,
        'email': 'test@example.com',
        'company': 'google',
        'phones' : [{
            'number' : '987654321' ,
            'type' : 'home'
        }]
    }
    data = json.dumps(data)
    data = data.encode("utf-8")
    for n in range(1, 10):
        # data = "Message number {}".format(n)        
        # # Data must be a bytestring
        # data = data.encode("utf-8")
        # When you publish a message, the client returns a future.
        future = publisher.publish(topic_path, data)
        print(future.result())

    print(f"Published messages to {topic_path}.")

if __name__ == '__main__':
    main()