s3cmd --config=s3cmd.config del s3://metrics-wba-dev/*/*

for i in `ls *gz`; do
	folder=$(echo $i | cut -f1 -d'.')
	s3cmd --server-side-encryption --server-side-encryption-kms-id=6131bdda-0a0c-4106-9337-4b88bb6eb0e7 --config=s3cmd.config put $i s3://metrics-wba-dev/$folder/
done

for i in `find . -name "fact**gz"`; do
	folder=$(echo $i | cut -f2 -d'/')
	file=$(echo $i | cut -f3 -d'/')
	partition=$(echo $i | cut -f3 -d'.')
	level=$(echo $i | cut -f4 -d"_" | cut -f1 -d"/")
	if [ "$level" == "" ]; then
	  level="store"
	fi
	s3cmd --server-side-encryption --server-side-encryption-kms-id=6131bdda-0a0c-4106-9337-4b88bb6eb0e7 --config=s3cmd.config put $folder/$file s3://metrics-wba-dev/$folder/${level}_id=$partition/
done
