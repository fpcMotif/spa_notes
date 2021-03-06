docs:
	echo "Building..."
	R CMD BATCH build.R
	echo "Build successfully completed"
website:
	R CMD BATCH build.R
	echo "Build successfully completed"
	git add index.html points.html points_book.pdf sp_eco.html sp_eco_book.pdf flows.html flows_book.pdf
	git commit -m "Update of HTML and PDF pre-website build"
	cp index.html temp_index.html
	cp points.html temp_points.html
	cp sp_eco.html temp_sp_eco.html
	cp flows.html temp_flows.html
	git checkout gh-pages
	git pull origin gh-pages
	mv temp_index.html index.html
	mv temp_points.html points.html
	mv temp_sp_eco.html sp_eco.html
	mv temp_flows.html flows.html
	git add index.html points.html sp_eco.html flows.html
	git commit -am "Building website"
	git push origin gh-pages
	git checkout master

