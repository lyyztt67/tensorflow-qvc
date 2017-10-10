import tensorflow as tf
a = tf.constant(3.0, tf.float32)
sess = tf.Session()
print("see.run(a):", sess.run(a))
