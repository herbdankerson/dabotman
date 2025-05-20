#!/bin/sh
set -e
MODEL="${BERT_MODEL:-bert-base-uncased}"
python - <<PY
from transformers import AutoModel, AutoTokenizer
import os
model_name = os.environ.get('BERT_MODEL', 'bert-base-uncased')
AutoModel.from_pretrained(model_name)
AutoTokenizer.from_pretrained(model_name)
print(f"Downloaded {model_name}")
PY
exec "$@"
