all:
	@make -C nvinfer_lpr_parser
	@make -C lpr-app
clean:
	@make clean -C nvinfer_lpr_parser
	@make clean -C lpr-app
