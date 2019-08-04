<?php

namespace App\Mail;

use Illuminate\Bus\Queueable;
use Illuminate\Mail\Mailable;
use Illuminate\Queue\SerializesModels;
use Illuminate\Contracts\Queue\ShouldQueue;
use Illuminate\Http\Request;

class ActivationCreted extends Mailable
{
    use Queueable, SerializesModels;
    /**
     * Create a new message instance.
     *
     * @return void
     */
    public function __construct($request)
    {
        $this->id = $request->user_id;
    }

    /**
     * Build the message.
     *
     * @return $this
     */
    public function build()
    {
        $frontendURL = "http://kinoshitadaiki.bitter.jp/newDEMESI/";
        return $this->subject('アカウント有効化メール')
            ->markdown('emails.activations.created')
            ->with([
                'link' => $frontendURL . "public/user/registration?user_id=".$this->id
            ]);
    }
}