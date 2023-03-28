set -o errexit  # exit on error

pip install -r requirements.txt

python ./kavach/manage.py collectstatic --no-input
python ./kavach/manage.py migrate