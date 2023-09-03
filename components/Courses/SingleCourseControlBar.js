"use client";
import React from "react";
import BuyModal from "../Modals/BuyModal";

import { useSession } from "next-auth/react";
import Link from "next/link";

function SingleCourseControlBar({ id }) {
  const { data: session, status } = useSession();
  const [showBuyModal, setShowBuyModal] = React.useState(false);
  return (
    <>
      <div className="flex justify-between items-center">
        <div>tags</div>
        <div className="space-x-1 text-sm">
          <button className="bg-gray-100 text-black px-3 py-1 rounded-md space-x-1">
            <div className="flex items-center space-x-1">
              <svg
                xmlns="http://www.w3.org/2000/svg"
                viewBox="0 0 24 24"
                fill="currentColor"
                className="w-3 h-3"
              >
                <path d="M19 14a5 5 0 0 0-3.59 1.53l-5.49-2.75A4.91 4.91 0 0 0 10 12a4.91 4.91 0 0 0-.08-.78l5.49-2.75A5 5 0 1 0 14 5a4.91 4.91 0 0 0 .08.78L8.59 8.53a5 5 0 1 0 0 6.94l5.49 2.75A4.91 4.91 0 0 0 14 19a5 5 0 1 0 5-5Z" />
              </svg>

              <span>Хуваалцах</span>
            </div>
          </button>

          <button className="bg-gray-100 text-black px-3 py-1 rounded-md ">
            Хадгалах
          </button>
          {session ? (
            <button
              onClick={() => setShowBuyModal(true)}
              className="bg-red-400 text-white px-3 py-1 rounded-md "
            >
              Сургалт авах
            </button>
          ) : (
            <Link
              className="bg-red-400 text-white px-3 py-1 rounded-md "
              href={`/auth/signin?callbackUrl=/courses/${id}`}
            >
              Сургалт авах
            </Link>
          )}
        </div>
      </div>
      {showBuyModal && (
        <BuyModal setShowBuyModal={setShowBuyModal}>
          <h1 className="mb-20">Сургалт худалдаж авах</h1>
          <div className="">Төлбөр төлөх хэсэг</div>
        </BuyModal>
      )}
    </>
  );
}

export default SingleCourseControlBar;
