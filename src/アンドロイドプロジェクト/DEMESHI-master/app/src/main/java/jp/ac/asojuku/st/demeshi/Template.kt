package jp.ac.asojuku.st.demeshi

import android.content.Intent
import android.support.v7.app.AppCompatActivity
import android.os.Bundle
import kotlinx.android.synthetic.main.activity_template.*

class Template : AppCompatActivity() {


    var user_id = 0

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_template)
        user_id = intent.getIntExtra("UserId",0)
        Back.setOnClickListener{
            val intent = Intent(this,MyCardList::class.java)
            intent.putExtra("UserId",user_id)
            startActivity(intent)
        }
        Template1.setOnClickListener{Create(1)}
        Template2.setOnClickListener{Create(2)}
        Template3.setOnClickListener{Create(3)}
        Template4.setOnClickListener{Create(4)}
        Template5.setOnClickListener{Create(5)}
        Template6.setOnClickListener{Create(6)}
        Template7.setOnClickListener{Create(7)}
        Template8.setOnClickListener{Create(8)}
        Template9.setOnClickListener{Create(9)}
    }
    fun Create(num:Int){
        when((num-1)/3){
            0->{
                //CreateCard
                val intent = Intent(this,CreateIndividual::class.java)
                intent.putExtra("Image",num)
                intent.putExtra("UserId",user_id)
                startActivity(intent)
            }
            1->{
                //CreateIndividual
                val intent = Intent(this,CompanyInfo::class.java)
                intent.putExtra("Image",num)
                intent.putExtra("Confirm","Individual")
                intent.putExtra("UserId",user_id)
                startActivity(intent)
            }
            2->{
                //CreateCompany
                val intent = Intent(this,CompanyInfo::class.java)
                intent.putExtra("Image",num)
                intent.putExtra("Confirm","Company")
                intent.putExtra("UserId",user_id)
                startActivity(intent)
            }
        }
    }
}