class KittensController < ApplicationController
	def index
		@kittens = Kitten.all
		respond_to do |format|
			format.html
			format.json { render :json => @kittens }
		end
	end
	
	def show
		if Kitten.exists?(params[:id])
			@kitten = Kitten.find(params[:id])
		else
			flash[:warning] = "Kitten does not exist!"
			redirect_to root_path
		end
		respond_to do |format|
			format.html
			format.json { render :json => @kitten }
		end
	end
	
	def new
		@kitten = Kitten.new
	end
	
	def create
		@kitten = Kitten.create(kitten_params)
		if @kitten.save
			flash[:success] = "Kitten created successfully!"
			redirect_to @kitten
		else
			flash[:failure] = "Something went wrong"
			render new_kitten_path
		end
	end

	def edit
		@kitten = Kitten.find(params[:id])
	end

	def update
		@kitten = Kitten.find(params[:id])
		if @kitten.update_attributes(kitten_params)
			flash[:success] = "Kitten updated successfully"
			redirect_to @kitten
		else
			render 'edit'
		end
	end

	def destroy
		Kitten.find(params[:id]).destroy
		flash[:success] = "You monster."
		redirect_to kittens_url
	end

	private
	
	def kitten_params
		params.require(:kitten).permit(:name, :age, :cuteness, :softness)
	end
end
