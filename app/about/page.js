import React from "react";
import Image from "next/image";

import img1 from "assets/about/bayalagmaa (1).png";
import img2 from "assets/about/baterdene.png";
import img3 from "assets/about/Tsaganaa-1.png";
import img4 from "assets/about/basaa-min-polyu2tueu4mnx0cro5a2k884magsrenf4wysrujm8.jpg";
import img5 from "assets/about/tseej-zureg-B.Oyuntugs-min-polyupdyyuziek3l3xwbqejadv79xhw7i8kmbex3gw.jpg";
import img6 from "assets/about/boogii-pom0ga03kjsriqgzxbsoydio8hfme3gcf729ijk0cw.jpg";

const data = [
  {
    img: img1,
    name: "Н.Баялагмаа",
    title: " АУ-ны доктор",
    position: "Үүсгэн байгуулагч, тэргүүн",
    position2: "Дотрын ахлах зэргийн эмч",
  },
  {
    img: img2,
    title: " АУ-ны магистр",
    name: "Н.Бат-Эрдэнэ",
    position: "Үүсгэн байгуулагч, контент бүтээгч",
    position2: "Дотрын ахлах зэргийн эмч",
  },
  {
    img: img3,
    name: "Д.Цагаан",
    title: " АУ-ны магистр",
    position: "Анхны тусламжийн сургагч багш, контент бүтээгч",
    position2: "Сэхээн амьдруулалт, яаралтай тусламжийн эмч",
  },
  {
    img: img4,
    title: "АУ-ны магистр",
    name: "Ц.Басбиш",
    position: "Контент бүтээгч",
  },
  {
    img: img5,
    name: "Б.Оюунтөгс",
    title: "АУ-ны доктор",
    position: "Контент бүтээгч",
  },
  {
    img: img6,
    name: "Н.Болор-Эрдэнэ",
    position: "Медиа, мэдээллийн технологи хариуцсан мэргэжилтэн",
  },
];

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
          {data.map((item, i) => (
            <div
              key={i}
              className="w-full md:w-1/2 lg:w-1/3 flex flex-col items-center space-y-4"
            >
              <div className="w-[200px] h-[200px] relative">
                <Image
                  src={item.img}
                  fill
                  style={{
                    objectFit: "cover",
                    borderRadius: "50%",
                  }}
                />
              </div>
              <h1 className="font-bold text-xl text-[#001540]">{item.name}</h1>
              <p className="text-[#8798bf]">{item.title}</p>
              <p className="text-[#8798bf]">{item.position}</p>
              {item.position2 && (
                <p className="text-[#8798bf]">{item.position2}</p>
              )}
            </div>
          ))}
        </div>
      </div>
    </>
  );
}

export default About;
