from PIL import Image
import glob
import time
import sys

# Code adapted from https://propolis.io/articles/make-animated-gif-using-python.html

images = []

if __name__ == "__main__":
    for arg in sys.argv[1:]:
        img = Image.open(arg)
        img = img.resize((512, 512), resample=0)
        images.append(img)

last_frame = (len(images))

for x in range(0, 2):
    img = images[last_frame-1]
    images.append(img)

timestr = time.strftime("%Y%m%d-%H%M%S")

images[0].save('outputs/gifs/example_' + timestr + '.gif', save_all=True, append_images=images[1:], optimize=False, duration=1000, loop=0)
