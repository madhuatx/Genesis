import genesis as gs
import os
os.environ['PYOPENGL_PLATFORM'] = 'glx'

gs.init(backend=gs.vulkan)

scene = gs.Scene(show_viewer=True)

plane = scene.add_entity(
    gs.morphs.Plane(),
)
franka = scene.add_entity(
    # gs.morphs.URDF(
    #     file='urdf/panda_bullet/panda.urdf',
    #     fixed=True,
    # ),
    gs.morphs.MJCF(file="xml/franka_emika_panda/panda.xml"),
)

scene.build()
for i in range(1000):
    scene.step()
