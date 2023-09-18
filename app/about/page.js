import React from "react";
import Image from "next/image";

import img1 from "assets/about/bayalagmaa (1).png";
import img2 from "assets/about/baterdene.png";
import img3 from "assets/about/Tsaganaa-1.png";
import img4 from "assets/about/basaa-min-polyu2tueu4mnx0cro5a2k884magsrenf4wysrujm8.jpg";
import img5 from "assets/about/tseej-zureg-B.Oyuntugs-min-polyupdyyuziek3l3xwbqejadv79xhw7i8kmbex3gw.jpg";
import img6 from "assets/about/boogii-pom0ga03kjsriqgzxbsoydio8hfme3gcf729ijk0cw.jpg";

function About() {
  return (
    <>
      <div className="w-full bg-[#001540] pt-[80px]">
        <div className="max-w-[600px] w-full mx-auto py-20 space-y-6">
          <h1 className="font-bold text-2xl text-red-300">Өдрийн мэнд</h1>
          <h1 className="font-bold text-2xl text-white">
            Чагнуур эмч, мэргэжилтнүүдийн нийгэмлэг
          </h1>
          <p className="text-[#8798bf]">
            “Чагнуур” эмч, мэргэжилтнүүдийн нийгэмлэг ТББ нь 2019 онд үүсгэн
            байгуулагдсан бөгөөд эмч, эмнэлгийн мэргэжилтнүүдийн давтан
            сургалтыг чанаржуулах, хүртээмжийг нэмэгдүүлэх, ажлын байран дээрхи
            хэрэгцээтэй сургалтыг хүргэх зэрэг зорилготой ажиллаж байна.
          </p>
          <p className="text-[#8798bf]">
            Түүнчлэн албан байгууллага, хамт олонд зориулан Анхны тусламж, эрүүл
            мэндийн боловсрол олгох танхмийн болон цахим хосолсон сургалтуудыг
            зохион байгуулдаг.
          </p>
        </div>
      </div>
      <div className="w-full bg-white">
        <div className="w-full max-w-[900px] flex flex-wrap mx-auto px-10 pt-10 ">
          <div className="w-1/3">
            <div className="w-full  ">
              <div className="w-full aspect-square relative">
                <Image
                  src={img1}
                  fill
                  style={{
                    objectFit: "contain",
                  }}
                />
              </div>
              <h1>Н.Баялагмаа, АУ-ны доктор</h1>
              <h1 className="">Үүсгэн байгуулагч, тэргүүн</h1>
              <h1 className="">Дотрын ахлах зэргийн эмч</h1>
            </div>
          </div>
          <div className="w-1/3">
            <div className="w-full  ">
              <div className="w-full aspect-square relative">
                <Image
                  src={img2}
                  fill
                  style={{
                    objectFit: "contain",
                  }}
                />
              </div>
              <h1>Н.Бат-Эрдэнэ, АУ-ны магистр</h1>
              <h1 className="">Үүсгэн байгуулагч, контент бүтээгч</h1>
              <h1 className="">Дотрын ахлах зэргийн эмч</h1>
            </div>
          </div>
          <div className="w-1/3">
            <div className="w-full  ">
              <div className="w-full aspect-square relative">
                <Image
                  src={img3}
                  fill
                  style={{
                    objectFit: "contain",
                  }}
                />
              </div>
              <h1>Д.Цагаан, АУ-ны магистр</h1>
              <h1 className="">
                Анхны тусламжийн сургагч багш, контент бүтээгч
              </h1>
              <h1 className="">Сэхээн амьдруулалт, яаралтай тусламжийн эмч</h1>
            </div>
          </div>
          <div className="w-1/3">
            <div className="w-full  ">
              <div className="w-full aspect-square relative">
                <Image
                  src={img4}
                  fill
                  style={{
                    objectFit: "contain",
                  }}
                />
              </div>
              <h1>Ц.Басбиш, СУ-ны доктор</h1>
              <h1 className="">Контент бүтээгч</h1>
            </div>
          </div>
          <div className="w-1/3">
            <div className="w-full  ">
              <div className="w-full aspect-square relative">
                <Image
                  src={img5}
                  fill
                  style={{
                    objectFit: "contain",
                  }}
                />
              </div>
              <h1>Б.Оюунтөгс, АУ-ны доктор</h1>
              <h1 className="">Контент бүтээгч</h1>
            </div>
          </div>
          <div className="w-1/3">
            <div className="w-full  ">
              <div className="w-full aspect-square relative">
                <Image
                  src={img6}
                  fill
                  style={{
                    objectFit: "contain",
                  }}
                />
              </div>
              <h1>Н.Болор-Эрдэнэ</h1>
              <h1 className="">
                Медиа, мэдээллийн технологи хариуцсан мэргэжилтэн
              </h1>
            </div>
          </div>
        </div>
      </div>
    </>
  );
}

export default About;
