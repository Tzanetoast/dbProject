import torch
from diffusers import StableDiffusionPipeline
from PIL import Image

def test_pipeline():
    model_id = "CompVis/stable-diffusion-v1-4"
    device = "cpu"  # Force usage of CPU
    print(f"Using device: {device}")
    pipe = StableDiffusionPipeline.from_pretrained(model_id)
    pipe = pipe.to(device)
    prompt = "A futuristic cityscape"
    image = pipe(prompt).images[0]
    image.save("test_image.png")
    print("Image saved as test_image.png")

if __name__ == "__main__":
    test_pipeline()
