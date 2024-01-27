import base64

data = input()
key = "4444"

S = list(range(256))
j = 0
out = ''

# KSA Phase
for i in range(256):
    j = (j + S[i] + ord(key[i % len(key)])) % 256
    S[i], S[j] = S[j], S[i]

# PRGA Phase
i = j = 0
for char in data:
    i = (i + 1) % 256
    j = (j + S[i]) % 256
    S[i], S[j] = S[j], S[i]
    out += chr(ord(char) ^ S[(S[i] + S[j]) % 256])

print(out)
