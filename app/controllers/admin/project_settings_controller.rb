class Admin::ProjectSettingsController < ApplicationController
before_filter :authenticate_admin! ,:except => [:show]
	def index
		@settings = ProjectSetting.all	
	end

	def show
		@settings = ProjectSetting.find(params[:id])
		@setting = Hash["configs" => [@settings]]
		
		respond_to do |format|
			format.html
			format.json { render json: @setting }
		end
	end

	def new
		@setting = ProjectSetting.new
	end

	def edit
		@setting = ProjectSetting.find(params[:id])
	end

	def create
		 @setting = ProjectSetting.new(project_params)
			respond_to do |format|
			if @setting.save
			format.html { redirect_to admin_project_settings_path, notice: 'Setting was successfully created.' }
			format.json { render :show, status: :created, location: @setting }
			else
			format.html { render :new }
			format.json { render json: @setting.errors, status: :unprocessable_entity }
			end
			end
	end

	def update

		@setting = ProjectSetting.find(params[:id])
		respond_to do |format|
		if @setting.update(project_params)
		format.html { redirect_to admin_project_settings_path, notice: 'Project  updated successfully.' }
		format.json { head :no_content }
		else
		format.html { render 'edit' }
		format.json { render json: @setting.errors, status: :unprocessable_entity }
		end
		end

		
	end

	private
		def project_params
			params.require(:project_setting).permit(:project_name,:access)
		end
end
