from flask import Flask,render_template,request
from DBConnection import Db

app = Flask(__name__)

#Admin Module/////////////////////////////////////////////////////////////////////////////////////////////

@app.route('/',methods=['GET','POST'])
def login():
    if request.method=='POST':
        username=request.form['textfield']
        password=request.form['textfield2']
        db=Db()
        ss=db.selectOne("select * from login where username='"+username+"' and password='"+password+"'")
        if ss is not None:
            if ss['usertype']=="admin":
                return render_template('admin/AdminHome.html')
            elif ss['usertype']=="blood bank":
             return render_template('bank/home.html')
        else:
            return '<script>alert("invalid");window.location="/"</script>'
    return render_template('admin/login1.html')


@app.route('/admin_home')
def admin_home():
   return render_template('admin/AdminHome.html')


@app.route('/view_accepted_donors')
def view_accepted_donors():
    db=Db()
    ss = db.select("select * from donor,login where donor.donor_id=login.login_Id and login.usertype='donor'")
    print(ss)
    return render_template('admin/acccepted donors view.html',data=ss)

@app.route('/accept_bank')
def accept_bank():

    db=Db()
    ss=db.select("select * from blood_bank,login where blood_bank.bank_id=login.login_Id and login.usertype='bank'")

    return render_template('admin/accepted_bank_view.html',data=ss)

@app.route('/view_donors')
def view_donors():
    db=Db()
    ss=db.select("select * from donor,login where donor.donor_id=login.login_Id and login.usertype='pending'")
    return render_template('admin/admin_view.html',data=ss)

@app.route('/accepted_donors/<p>')
def accepted_donors(p):
    db=Db()
    db.update("update login set usertype='donor' where login_Id='"+str(p)+"'")


    return '<script>alert("accepted");window.location="/view_donors"</script>'

@app.route('/view_blood_bank')
def view_blood_bank():
    db=Db()
    ss=db.select("select * from  blood_bank,login where blood_bank.bank_id=login.login_Id and login.usertype='pending'")
    return render_template('admin/blood_bankaccept.html',data=ss)

@app.route('/view_user')
def view_user():
    db=Db()
    ss=db.select("select * from user")
    return render_template('admin/viewUser.html',data=ss)

@app.route('/feedback')
def feedback():
    db=Db()
    ss=db.select("select * from feedback,user where feedback.user_id=user.user_id")
    return  render_template('admin/feedbackView.html',data=ss)


@app.route('/accepted_bank/<p>')
def accepted_bank(p):
    db=Db()
    db.update("update login set usertype='bank' where login_Id='"+str(p)+"'")


    return '<script>alert("accepted");window.location="/view_blood_bank"</script>'

@app.route('/rejected_bank/<p>')
def rejected_bank(p):
    db=Db()
    db.delete("delete from login where login_Id='"+str(p)+"'")
    db.delete("delete from blood_bank where bank_id='"+str(p)+"'")

    return '<script>alert("rejected");window.location="/view_blood_bank"</script>'

@app.route('/rejected_donor/<p>')
def rejected_donor(p):
    db=Db()
    db.delete("delete from login where login_Id='"+str(p)+"'")
    db.delete("delete from donor where donor_id='" + str(p) + "'")

    return '<script>alert("rejected");window.location="/view_donors"</script>'

#Bank Module//////////////////////////////////////////////////////////////////////////////////////

@app.route('/register',methods=['GET','POST'])
def register():
    if request.method=='POST':
        Blood_bank_name=request.form['textfield']
        place=request.form['textfield2']
        PIN=request.form['textfield3']
        phone=request.form['textfield4']
        blood_group=request.form['check']
        email=request.form['textfield6']
        password=request.form['textfield5']
        confirm_password=request.form['textfield7']
        db=Db()
        res=db.insert("insert into login (username,password,usertype)values('"+email+"','"+password+"','blood bank')")
        db.insert("insert into blood_bank values('"+str(res)+"','"+Blood_bank_name+"','"+place+"','"+PIN+"','"+phone+"','"+blood_group+"','"+email+"')")
        return '<script>alert("Success");window.location="/"</script>'
    else:
        return render_template('bank/registeration.html')


@app.route('/manage_donor')
def manage_donor():
    db=Db()
    ss=db.select("select * from donor,login where donor.donor_id=login.login_Id and login.usertype='pending'")
    return render_template('bank/donor_add_remove.html',data=ss)


@app.route('/blood_stock')
def blood_stock():
    return  render_template('bank/')

@app.route('/donor_requests')
def donor_requests():
   return render_template('bank/')

@app.route('/user_requests')
def user_requests():
    return  render_template('bank/')


if __name__ == '__main__':
    app.run()






