import weka.core.jvm as jvm
from weka.core.classes import Random
from weka.core.converters import Loader
from weka.classifiers import Classifier, Evaluation, PredictionOutput
from weka.core.dataset import Instance
import requests

# Define the API endpoint and your token
api_url = "https://api.waqi.info/feed/@5135/?token=46259d035050efd6759b13ceedca302b3e3ef05a"

# Fetch AQI data
response = requests.get(api_url)
if response.status_code == 200:
    data = response.json()
    if data['status'] == 'ok':
        aqi_data = data['data']['iaqi']
        pm25 = aqi_data.get('pm25', {'v': 0})['v']
        pm10 = aqi_data.get('pm10', {'v': 0})['v']
        o3 = aqi_data.get('o3', {'v': 0})['v']
        no2 = aqi_data.get('no2', {'v': 0})['v']
        so2 = aqi_data.get('so2', {'v': 0})['v']
        date_time = data['data']['time']['s']

        print(f"Fetched AQI values:\nPM2.5: {pm25}, PM10: {pm10}, O3: {o3}, NO2: {no2}, SO2: {so2}")

jvm.start(packages=True)

data_file = 'air_quality.arff'
loader = Loader(classname="weka.core.converters.ArffLoader")
data = loader.load_file(data_file)
data.class_is_last()

# generate train/test split of randomized data
train, test = data.train_test_split(66.0, Random(420))

# build and train a classifier
J48_classifier = Classifier(classname="weka.classifiers.trees.J48")
J48_classifier.build_classifier(train)
print(f"J48 Classifier structure:\n{J48_classifier}")

MP_classifier = Classifier(classname="weka.classifiers.functions.MultilayerPerceptron")
MP_classifier.build_classifier(train)
print(f"\nMultylayer Perceptron structure:\n{MP_classifier}")

# test the model
J48_evaluation = Evaluation(train)
output = PredictionOutput(classname="weka.classifiers.evaluation.output.prediction.PlainText")
J48_evaluation.test_model(J48_classifier, test, output=output)

MP_evaluation = Evaluation(train)
MP_evaluation.test_model(MP_classifier, test, output=output)

# Print evaluation results
print(f"\nEvaluation Summary of J48:\n{J48_evaluation.summary()}")
print(f"\nConfusion Matrix:\n{J48_evaluation.confusion_matrix}")
print(f"\nDetailed Class Evaluation:\n{J48_evaluation.class_details()}")

print(f"\nEvaluation Summary of Multylayer Perceptron:\n{MP_evaluation.summary()}")
print(f"\nConfusion Matrix:\n{MP_evaluation.confusion_matrix}")
print(f"\nDetailed Class Evaluation:\n{MP_evaluation.class_details()}")

# Predict current air quality for a given set of AQI values
new_instance = Instance.create_instance([pm25, pm10, o3, no2, so2, 0])  # Replace with actual AQI values
new_instance.dataset = data

J48_predicted_index = J48_classifier.classify_instance(new_instance)
J48_predicted_class = new_instance.class_attribute.value(int(J48_predicted_index))
print(f"\nPredicted air quality class (J48) on date {date_time}: {J48_predicted_class}")
MP_predicted_index = MP_classifier.classify_instance(new_instance)
MP_predicted_class = new_instance.class_attribute.value(int(J48_predicted_index))

print(f"\nPredicted air quality class (Multylayer Perceptron) on date {date_time}: {MP_predicted_class}")

# find out current air quality in Ljubljana
#print(evaluation.summary())

jvm.stop()
