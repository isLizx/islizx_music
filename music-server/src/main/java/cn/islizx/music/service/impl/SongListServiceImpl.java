package cn.islizx.music.service.impl;


import cn.islizx.music.dao.SongListMapper;
import cn.islizx.music.domain.SongList;
import cn.islizx.music.service.SongListService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class SongListServiceImpl implements SongListService {

    @Autowired
    private SongListMapper songListMapper;

    @Override
    public boolean updateSongListMsg(SongList songList) {
        return songListMapper.updateSongListMsg(songList) >0 ?true:false;
    }

    @Override
    public boolean deleteSongList(Integer id) {
        return songListMapper.deleteSongList(id) >0 ?true:false;
    }

    @Override
    public List<SongList> allSongList()
    {
        return songListMapper.allSongList();
    }

    @Override
    public List<SongList> likeTitle(String title)
    {
        return songListMapper.likeTitle(title);
    }

    @Override
    public List<SongList> likeStyle(String style)
    {
        return songListMapper.likeStyle(style);
    }

    @Override
    public List<SongList> songListOfTitle(String title)
    {
        return songListMapper.songListOfTitle(title);
    }

    @Override
    public boolean addSongList(SongList songList)
    {
        return songListMapper.insertSelective(songList) > 0?true:false;
    }

    @Override
    public boolean updateSongListImg(SongList songList) {

        return songListMapper.updateSongListImg(songList) >0 ?true:false;
    }
}
