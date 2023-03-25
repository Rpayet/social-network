<?php

namespace App\Controller;

use App\Repository\UserRepository;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;

class MemberController extends AbstractController
{
    #[Route('/member', name: 'app_member')]
    public function index(UserRepository $repository): Response
    {
        return $this->render('member/index.html.twig', [
            'users' => $repository->findAll(),
        ]);
    }

    #[Route('/member/{id}', name: 'app_member_profil')]
    public function show(Request $request, UserRepository $repository, int $id): Response
    {
        $user = $repository->find($id);

        if (!$user) {
            throw $this->createNotFoundException('Utilisateur inexistant');
        }

        return $this->render('member/profil.html.twig', [
            'user' => $user,
            ]);
    }

    #[Route('/member/{id}/edit', name: 'app_member_edit')]
    public function edit(): Response
    {
        return $this->render('member/edit.html.twig');
    }
}
