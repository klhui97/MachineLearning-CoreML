import turicreate as turi

url = "dataset/"
data = turi.image_analysis.load_images(url)
data["flowerType"] = data["path"].apply(lambda path: "Arugula" if "Arugula" in path else "Raddish" if "Raddish" in path else "Tomato" if "Tomato" in path else "Yellow Buttercups" if "Yellow Buttercups" in path else "Sunflower" if "Sunflower" in path else "Zinnia" if "Zinnia" in path else "Periwinkle" if "Periwinkle" in path else "Morning Glory" if "Morning Glory" in path else "Lettuce" if "Lettuce" in path else "Pansy")
data.save("flowerType.sframe")
data.explore()


dataBuffer = turi.SFrame("flowerType.sframe")
trainingBuffers, testingBuffers = dataBuffer.random_split(0.9)
model = turi.image_classifier.create(trainingBuffers, target="flowerType", model="resnet-50")
evaluations = model.evaluate(testingBuffers)
print(evaluations["accuracy"])
model.save("flowerType.model")
model.export_coreml("FlowerClassifier.mlmodel")