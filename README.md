# 4Kings Sorting Hat Project
 เป็นแอปพลิเคชั่นคัดสรรคนไปแต่ละสถาบันใน 4kings ประกอบไปด้วย 'ประชาชื่น' , 'อินทร' , 'กนกอาชีวะ' และ 'บูรณพนธ์' 
โดยที่ตัวแอปพลิเคชั่นนี้จะทำการรับจำนวนคนที่ต้องการที่จะเพิ่มเข้าสถาบัน หลังจากนั้นทำการสุ่มโดยเฉลี่ยคนในกลุ่มให้เท่าๆกัน 
มีการแสดงผลโดยขึ้นว่าชื่อคนๆนี้ไปอยู่กลุ่มไหนพร้อมรูปภาพ และสามารถดูรายชื่อสมาชิกของแต่ละกลุ่มได้
โปรเจ็คนี้พัฒนาด้วยภาษา Dart ผ่าน flutter framework

# วิธีรันแอปพลิเคชั่น
- โหลดตัว .apk ไฟล์ ไปติดตั้งใน Android [Click to Download](https://drive.google.com/file/d/1k7VFyG6Ynk_Vb0UL7fG8ZsJuEGeJW5S4/view?usp=sharing)
- การรันผ่านตัว vscode

### !! สิ่งที่ต้องเตรียมในการรันผ่านตัว vscode
  1. ลง vscode พร้อม flutter extension [Click](https://code.visualstudio.com/)  
  2. ทำการติดตั้ง flutter sdk [Click](https://docs.flutter.dev/get-started/install/windows/mobile?tab=virtual)  พร้อมวิธีติดตั้งอย่างละเอียด
  3. ติดตั้ง Android Studio และลง flutter extension [Click](https://developer.android.com/studio)
     - เมื่อติดตั้งแล้วเปิดแอปพลิเคชั่นขึ้นมา เลือก Android Studio Setup Wizard
       
       ให้ดาวน์โหลด components
       - Android SDK Platform, API 34.0.0
       - Android SDK Command-line Tools
       - Android SDK Build-Tools
       - Android SDK Platform-Tools
       - Android Emulator
      - หลังจากนั้นให้ทำการสร้าง emulator ตัวไหนก็ได้ตามที่ต้องการ
    
หรือสามารถดูวิธีการติดตั้งทั้งหมดได้ที่ [Youtube](https://youtu.be/3jGj-1-m_zA?si=H0ugLUzsPQJamtib) เลือกดูได้ตามส่วนเนื้อหาของคลิป

### วิธีการรันผ่าน vscode
1. clone repo นี้ไปในเครื่อง
2. เปิด vscode และเลือกเปิด folder ที่ clone มา
3. เลือกเชื่อมตัว emulator ที่เราสร้างโดยสังเกตได้จากมุมขวาล่างของ vscode
4. รันไฟล์ main.dart (ใน folder lib) โดยการกด f5
5. แอปพลิเคชั่นจะเปิดขึ้นมาในตัว emulator


# วิธีใช้งาน
1. เมื่อเข้ามาหน้าแรก จะมีช่องใส่จำนวนคนที่ต้องการแล้วกดปุ่มที่อยู่ด้านข้าง
2. ช่องใส่ชื่อจะแสดงผลขึ้นมาให้เราใส่ชื่อทีละคนให้ครบตามจำนวนที่ใส่เมื่อครบแล้วช่องจะหายไป
3. สามารถกดดูรายชื่อคนในแต่ละกลุ่มได้โดยการกด ดูรายชื่อสมาชิก
