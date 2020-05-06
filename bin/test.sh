export BIOBERT_DIR=./model/bert_yesno
export BIOASQ_DIR=./datasets

python run_yesno.py \
	--do_train=False \
	--do_predict=True \
        --docone --docone_directory=$BIOASQ_DIR/QA/docone \
	--vocab_file=$BIOBERT_DIR/vocab.txt \
	--bert_config_file=$BIOBERT_DIR/bert_config.json \
	--init_checkpoint=$BIOBERT_DIR/model.ckpt-14470 \
	--max_seq_length=512 \
	--train_batch_size=10 \
	--learning_rate=5e-6 \
	--doc_stride=128 \
	--do_lower_case=False \
	--num_train_epochs=2 \
        --verbose_logging=True \
	--train_file=$BIOASQ_DIR/BioASQ-6b/train/Snippet-as-is/BioASQ-train-yesno-6b-snippet.json \
	--predict_file=$BIOASQ_DIR/BioASQ-6b/test/Snippet-as-is/BioASQ-test-yesno-6b-3-snippet.json \
	--output_dir=/tmp/yesno_output/

# ## list questions
# echo "Please use SQuADv1-trained model for factoid, list questions : BERT-pubmed-1000000-SQuAD/model.ckpt-14599"
# #export BIOBERT_DIR=$HOME/BioASQ/BERT-pubmed-1000000-SQuAD
# 
# python run_list.py \
#      --do_train=True \
#      --do_predict=True \
#      --vocab_file=$BIOBERT_DIR/vocab.txt \
#      --bert_config_file=$BIOBERT_DIR/bert_config.json \
#      --init_checkpoint=$BIOBERT_DIR/model.ckpt-14599 \
#      --max_seq_length=384 \
#      --train_batch_size=10 \
#      --learning_rate=5e-6 \
#      --doc_stride=128 \
#      --num_train_epochs=7 \
#      --do_lower_case=False \
#      --train_file=$BIOASQ_DIR/BioASQ-6b/train/Full-Abstract/BioASQ-train-list-6b-full-annotated.json \
#      --predict_file=$BIOASQ_DIR/BioASQ-6b/test/Full-Abstract/BioASQ-test-list-6b-3.json \
#      --output_dir=/tmp/list_output/