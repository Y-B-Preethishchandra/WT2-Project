from flask import Flask, render_template,request, session, redirect,flash,url_for,jsonify
from werkzeug.utils import secure_filename
from flask_wtf.csrf import CSRFProtect, CSRFError
import datetime
import json
import time
import os
from flaskext.mysql import MySQL
from sklearn.externals import joblib 
from nltk.classify import NaiveBayesClassifier

classifier = joblib.load('static/model.pkl')

def get_features(word_list):
	return dict([(word, True) for word in word_list])
app = Flask(__name__)
csrf = CSRFProtect(app)
mysql = MySQL()
ALLOWED_EXTENSIONS = {'png', 'jpg', 'jpeg'}
app.config['UPLOAD_FOLDER'] = '/home/ybpreethishchandra/Desktop/WT2 Project/static/uploads'
app.config['MYSQL_DATABASE_USER'] = 'root'
app.config['MYSQL_DATABASE_PASSWORD'] = ''
app.config['MYSQL_DATABASE_DB'] = 'ThePropertyFront'
app.config['MYSQL_DATABASE_HOST'] = 'localhost'
mysql.init_app(app)
conn = mysql.connect()
cursor =conn.cursor()
def allowed_file(filename):
    return '.' in filename and \
           filename.rsplit('.', 1)[1].lower() in ALLOWED_EXTENSIONS
@app.route('/',methods=['GET'])
@csrf.exempt
def home():
	if(session.get('logged_in')==True):
		return render_template('project1.html')
	return render_template('project.html')
@app.route('/getChunk/<count>',methods=['GET'])
@csrf.exempt
def getChunk(count):
	if(int(count)==-1):
		return "!mainstyle.css";
	
	if(int(count)==0):
		return "#pics/epic.jpeg";
	
	if(int(count)==1):
		return "pics/slide6.jpg;pics/sell.jpg";
	
	if(int(count)>=2):
		return "pics/map.jpg";

@app.route('/aboutus',methods=['GET'])
@csrf.exempt
def about():
	return render_template('aboutus.html')

@app.route('/login',methods=['GET','POST'])
def login():
	if(request.method=='GET'):
		if(session.get('status') == True):
			session.pop('status')
			return "<script type='text/javascript'>alert('invalid username/password');</script>"+render_template('login.html')
		return render_template('login.html')
	if(request.method=='POST'):
		username=request.form['uname']
		cursor.execute("select username,password from Users where username =%s; ",username)
		data=cursor.fetchone()
		if(data==None):
			session['status']=True
			return "<script>window.location.href='/login';</script>"
		password=request.form['psw']
		session['logged_in']=True
		session['uname']=username
		return redirect('/')
@app.route('/logout',methods=['GET'])
@csrf.exempt
def logout():
	session.pop('logged_in')
	session.pop('uname')
	return redirect('/')
@app.route('/signup',methods=['GET','POST'])
def signup():
	if(request.method=='GET'):
		if(session.get('status') == True):
			session.pop('status')
			return "<script type='text/javascript'>alert('invalid username/password');</script>"+render_template('signup.html')
		return render_template('signup.html')
	if(request.method=='POST'):
		uname=request.form['uname']
		cursor.execute("select username,password from Users where username =%s; ",uname)
		data=cursor.fetchone()
		if(data==None):
			email=request.form['email']
			gender=request.form['gender']
			bdaymonth=request.form['bdaymonth']
			ph=request.form['ph']
			psw1=request.form['psw1']
			insert_stmt = ("INSERT INTO Users VALUES (%s,%s,%s,%s,%s,%s);")
			data = (uname, email, gender[0], bdaymonth, ph,psw1)
			cursor.execute(insert_stmt, data)
			conn.commit()
			session['logged_in']=True
			session['uname']=uname
			return redirect('/')
		session['status']=True
		return redirect('/signup')

@app.route('/sell',methods=['GET','POST'])
def sell():
	if(request.method=='GET'):
		if(session.get('logged_in')==True):
			return render_template('up.html', )
		return redirect('/login')
	if(request.method=='POST'):
		ty=request.form['sell']
		file = request.files['fileToUpload']
		message=request.form['message']
		price=request.form['price']
		filepath=os.path.join(app.config['UPLOAD_FOLDER'], secure_filename(file.filename))
		if file.filename == '':
			flash('No selected file')
			return redirect('/sell')
		if file and allowed_file(file.filename):
			filename = secure_filename(file.filename)
			file.save(os.path.join(app.config['UPLOAD_FOLDER'], filename))
		insert_stmt = ("INSERT INTO Uploads VALUES (%s,%s,%s,%s,%s);")
		data = (ty,filepath,message,price,session.get('uname'))
		cursor.execute(insert_stmt, data)
		conn.commit()
		data=ty+'#'+filename+'#'+message+'#'+price
		session['uploaddata']=data
		return redirect('/selldisp')
@app.route('/selldisp', methods=['GET'])
@csrf.exempt
def selldisp():
	data=session.get('uploaddata')
	session.pop('uploaddata')
	data=data.split('#')
	data={'type':data[0],'filename':'static/uploads/'+data[1],'message':data[2],'price':data[3]}
	return render_template('selldisp.html',data=data)
@app.route('/buy')
@csrf.exempt
def project():
	if(session.get('logged_in')==True):
		return render_template('project2.html')
	return redirect('/login')
@app.route('/apartmentlist')
@csrf.exempt
def apartmentlist():
	return render_template('apartments.html')

@app.route('/apartments/<number>')
@csrf.exempt
def apartments(number):
	path = "/apartments/apart"+number+".html"
	return render_template(path)

@app.route('/mail', methods = ['POST', 'GET'])
@csrf.exempt
def mail():
        if request.method == 'POST':
                review = request.form['message']
                probdist = classifier.prob_classify(get_features(review.split()))
                pred_sentiment = probdist.max()
                if(pred_sentiment == "Positive"):
                        result=1
                        return render_template('project2.html', result = result)
                else:
                        result=-1
                        return render_template('project2.html', result = result)

@app.errorhandler(CSRFError)
def handle_csrf_error(e):
	return render_template('csrf_error.html', reason=e.description), 400
if __name__ == '__main__':
	app.secret_key = 'super secret key'
	app.run(debug=False, port = 80, host='0.0.0.0')
