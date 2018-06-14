import turicreate as turi

url = "dataset/"
data = turi.image_analysis.load_images(url)
data["flowerType"] = data["path"].apply(lambda path: "Pansy" if "Pansy" in path else "Sunflower" if "Sunflower" in path else "Zinnia")
data.save("flowerType.sframe")
data.explore()


dataBuffer = turi.SFrame("flowerType.sframe")
trainingBuffers, testingBuffers = dataBuffer.random_split(0.9)
model = turi.image_classifier.create(trainingBuffers, target="flowerType", model="resnet-50")
evaluations = model.evaluate(testingBuffers)
print(evaluations["accuracy"])
model.save("flowerType.model")
model.export_coreml("FlowerClassifier.mlmodel")