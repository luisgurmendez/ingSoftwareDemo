package org.services;

import static org.junit.Assert.*;

import java.math.BigInteger;
import java.util.Random;

import org.exchangableObjects.Player;
import org.junit.Test;

public class UserServiceTest {
	
	UserService userService = UserService.getInstance();

	@Test
	public void testLoginUser() {
		assertTrue(loginUser("Nicolas", "Contraseņa"));
		assertFalse(loginUser("Nicolas", "contraseņa"));
		assertTrue(loginUser("nicolas", "Contraseņa"));
		assertFalse(loginUser("HHH", "Contraseņa"));
		assertFalse(loginUser("Nicolas", "Contrasena"));
	}

	@Test
	public void testRegisterUser() {
		String randomWord = new BigInteger(130, new Random()).toString(32);
		assertTrue(userService.registerUser(randomWord, randomWord));
		assertFalse(userService.registerUser("Nicolas", "Contraseņa"));
		assertFalse(userService.registerUser("nicolas", "Contraseņa"));
		assertFalse(userService.registerUser("NICOLAS", "Contra"));
	}

	@Test
	public void testGetInformationAboutUser() {
		Player player = userService.getInformationAboutUser("Nicolas");
		assertEquals(player.getUsername(), "Nicolas");
		assertEquals(player.getPassword(), "Contraseņa");
		assertEquals(player.getPoints(), 0);
		Player player2 = userService.getInformationAboutUser("HHH");
		assertNull(player2);	
	}

	private boolean loginUser(String username, String password){
		Player player = new Player();
		player.setUsername(username);
		player.setPassword(password);
		return userService.loginUser(player);
	}

}
